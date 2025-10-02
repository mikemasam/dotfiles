#!/usr/bin/env python3
import os
import sys
import subprocess
import re

def rofi_select(options):
    rofi_input = '\n'.join(f"{label}" for label in options)
    rofi = subprocess.Popen(['rofi', '-dmenu', '-p', 'Bluetooth Device'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    selected, _ = rofi.communicate(input=rofi_input.encode())
    return selected.decode().strip()


def run_cmd(cmd):
    try:
        result = subprocess.run(cmd, shell=True, check=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
        return result.stdout.strip()
    except subprocess.CalledProcessError:
        return "" 

def connected_device():
    info = run_cmd("bluetoothctl info")
    if info and len(info.splitlines()) > 0:
        lines = info.splitlines();
        id = lines[0].split(" ")[1].strip();
        name = lines[1].split(": ", 1)[1].strip();
        battery = ""
        for line in reversed(lines):
            if "Battery Percentage" in line:
                last_word = line.strip().split()[-1]
                battery = re.sub(r"\D", "", last_word)
                break
        return { "id": id, "name": name, "battery": battery };
    return  None 
def get_devices():
    lines = run_cmd("bluetoothctl devices").splitlines()
    networks = []
    for line in lines:
        if line:
            parts = line.split(' ')
            id = parts[1]
            name = ' '.join(parts[2:]) 
            networks.append((id, name))
    return networks

def make_connection():
    current = connected_device();
    networks = get_devices()
    options = []
    if current:
        options.append(f"Disconnect - {current['name']}")
    for id, name in networks:
        if current is None or id != current['id']:
            label = f"{id} - {name}"
            options.append(label)
    selected = rofi_select(options)

    if selected:
        selected_id = selected.split('-')[0].strip()
        #print(f"{selected_id == 'Disconnect'}")
        if current and current['id'] == selected_id:
            print(f"Already connected to {current['name']}")
        elif selected_id == 'Disconnect':
            run_cmd("bluetoothctl disconnect")
        else:
            run_cmd(f"bluetoothctl connect {selected_id}")
def print_current():
    current = connected_device();
    if current is None:
        print(f" <b>🔵Disconnected </b>")
    else:
        print(f" <b>🔵{current['name']} {current['battery']}% </b>")

def main():
    block_button = os.getenv('BLOCK_BUTTON')

    if len(sys.argv) > 1 and sys.argv[1] == "control":
        block_button = "1" 
    if block_button == '1':
        make_connection()
    print_current()
if __name__ == "__main__":
    main()
