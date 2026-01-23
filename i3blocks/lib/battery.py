#!/usr/bin/env python3
import os
import re
import subprocess
import sys

# Battery instance from environment
bat_number = os.environ.get("BLOCK_INSTANCE", "0")
BLOCK_INSTANCE = os.getenv("BLOCK_INSTANCE")
BLOCK_BUTTON = os.getenv("BLOCK_BUTTON")

if len(sys.argv) > 1 and sys.argv[1] == "control":
    BLOCK_BUTTON = "1" 

def print_error(str):
    print(str)
    print(str)
    print("#FF0000")
    sys.exit(0)


def run_cmd(cmd):
    try:
        result = subprocess.run(
            cmd,
            shell=True,
            check=True,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError:
        return None


def display_status():
    acpi_output = ""
    try:
        # Get acpi output
        acpi_output = subprocess.check_output(["acpi", "-b"], universal_newlines=True)
    except subprocess.CalledProcessError:
        print_error("ACPI command failed")

    if not acpi_output:
        print_error("ACPI failed to load")
    # Filter battery line
    battery_lines = [
        line
        for line in acpi_output.strip().split("\n")
        if f"Battery {bat_number}" in line
    ]

    if not battery_lines:
        print_error("Battery not found")

    line = battery_lines[0]

    # Parse status and percent
    # match = re.search(r": (\w+), (\d+)%", line)
    match = re.search(r": ([\w ]+), (\d+)%", line)
    if not match or match is None:
        print_error(line)
        return

    status, percent = match.groups()
    percent = int(percent)
    full_text = f"{percent}%"

    if status == "Discharging":
        full_text = "⚡" + full_text + " DIS"
    elif status == "Charging":
        full_text = "⚡" + full_text + " CHR"
    else:
        full_text = "⚡" + full_text + " "

    short_text = full_text

    # Extract time if available
    time_match = re.search(r"(\d\d:\d\d):", line)
    if time_match:
        full_text += f" ({time_match.group(1)})"

    # Print output
    print(full_text)
    print(short_text)

    # Set color
    if status == "Discharging":
        if percent < 5:
            print("#FF0000")
            sys.exit(33)
        elif percent < 20:
            print("#FF0000")
        elif percent < 40:
            print("#FFAE00")
        elif percent < 60:
            print("#FFF600")
        elif percent < 85:
            print("#A8FF00")
        else:
            print("#FFFFFF")
    else:
        print("#00FF00")

    sys.exit(0)



def rofi_select(options):
    rofi_input = "\n".join(f"{label}" for label in options)
    rofi = subprocess.Popen(
        ["rofi", "-dmenu", "-p", "Hi, what next?"],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
    )
    selected, _ = rofi.communicate(input=rofi_input.encode())
    return selected.decode().strip()


if BLOCK_BUTTON == "1":
    options = ['Lock(l)', 'Shutdown(s)', 'Reboot(r)', 'Logout(o)']
    selected = rofi_select(options)
    si = options.index(selected)
    if si == 0:
        subprocess.run("notify-send \"Locking\"", shell=True)
        subprocess.run("~/.config/i3/i3lock-starter.sh", shell=True)
    elif si == 1:
        subprocess.run("notify-send \"Hint\" \"Run 'shutdown -h now' to shutdown.\"", shell=True)
        # subprocess.run("systemctl poweroff", shell=True)
    elif si == 2:
        subprocess.run("notify-send \"Hint\" \"Run 'reboot' to reboot\"", shell=True)
        # subprocess.run("systemctl reboot", shell=True)
    elif si == 3:
        subprocess.run("notify-send \"Logging out\"", shell=True)
        subprocess.run("i3-msg exit", shell=True)


display_status()
