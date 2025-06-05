#!/usr/bin/env python3

import subprocess
import sys
import os

def get_wifi_networks():
    # Get wifi networks via nmcli
    result = subprocess.run(
        ['nmcli', '-t', '-f', 'SSID,SECURITY', 'device', 'wifi', 'list'],
        capture_output=True, text=True
    )
    lines = result.stdout.strip().split('\n')
    networks = []
    for line in lines:
        if line:
            #ssid, security = line.split(':', 1)
            parts = line.split(':', 1)
            ssid = parts[0]
            security = parts[1] if len(parts) > 1 and parts[1] else '--'
            if ssid:
                networks.append((ssid, security))
    return networks

def rofi_select(options):
    rofi_input = '\n'.join(f"{label}" for label in options)
    rofi = subprocess.Popen(['rofi', '-dmenu', '-p', 'Wi-Fi'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    selected, _ = rofi.communicate(input=rofi_input.encode())
    return selected.decode().strip()

def connect_wifi(ssid, security):
    # If secured, prompt for password
    password = None
    if security != '--':
        try:
            dmenu = subprocess.Popen(['rofi', '-dmenu', '-password', '-p', f'Password for {ssid}'],
                                     stdin=subprocess.PIPE, stdout=subprocess.PIPE)
            password, _ = dmenu.communicate()
            password = password.decode().strip()
        except Exception:
            print("Failed to get password")
            sys.exit(1)

    # Build nmcli connect command
    if password:
        cmd = ['nmcli', 'device', 'wifi', 'connect', ssid, 'password', password]
    else:
        cmd = ['nmcli', 'device', 'wifi', 'connect', ssid]

    # Run command
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode == 0:
        print(f"Connected to {ssid}")
    else:
        print(f"Failed to connect: {result.stderr.strip()}")
        sys.exit(1)

def get_connected_ssid():
    try:
        result = subprocess.run(
            ['nmcli', '-t', '-f', 'ACTIVE,SSID', 'device', 'wifi'],
            capture_output=True, text=True, check=True
        )
        lines = result.stdout.strip().split('\n')
        for line in lines:
            active, ssid = line.split(':', 1)
            if active == 'yes':
                return ssid
        return None
    except Exception:
        return None

def print_current():
    ssid = get_connected_ssid()
    if ssid:
        print(f"<span color='lightgreen'>▂▄▆█ {ssid}</span>\n")
    else:
        print(f"<span color='blue'>No Connection</span>\n")
    sys.exit(0)
def main():
    block_button = os.getenv('BLOCK_BUTTON')
    if block_button != '1':
        print_current()
    networks = get_wifi_networks()
    if not networks:
        print("No Wi-Fi networks found")
        sys.exit(1)

    current_ssid = get_connected_ssid()
    options = []
    if current_ssid:
        options.append("Disconnect from Wi-Fi")
    for ssid, security in networks:
        label = f"{ssid} ({security})"
        if ssid == current_ssid:
            label += " [CONNECTED]"
        options.append(label)

    selected = rofi_select(options)
    if not selected:
        print_current() 
    if selected == "Disconnect from Wi-Fi":
        disconnect_wifi()
        print_current()

    ssid = selected.split(' (')[0]
    if ssid == current_ssid:
        print(f"Already connected to {ssid}")
        print_current()
    security = None
    for nssid, nsec in networks:
        if nssid == ssid:
            security = nsec
            break

    connect_wifi(ssid, security)
    print_current()

def disconnect_wifi():
    result = subprocess.run(
        ['nmcli', '-t', '-f', 'DEVICE,TYPE,STATE', 'device'],
        capture_output=True, text=True
    )
    for line in result.stdout.strip().split('\n'):
        try:
            device, devtype, state = line.split(':')
            if devtype == 'wifi' and state == 'connected':
                subprocess.run(['nmcli', 'device', 'disconnect', device])
                print(f"Disconnected {device}")
                return
        except ValueError:
            continue
    print("No connected Wi-Fi device found.")
if __name__ == "__main__":
    main()
