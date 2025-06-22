#!/usr/bin/env python3
import os
import re
import subprocess
import sys

# Battery instance from environment
bat_number = os.environ.get("BLOCK_INSTANCE", "0")

try:
    # Get acpi output
    acpi_output = subprocess.check_output(
        ["acpi", "-b"], universal_newlines=True
    )
except subprocess.CalledProcessError:
    print("ACPI command failed")
    print("ACPI command failed")
    print("#FF0000")
    sys.exit(0)

# Filter battery line
battery_lines = [
    line for line in acpi_output.strip().split("\n")
    if f"Battery {bat_number}" in line
]

if not battery_lines:
    print("Battery not found")
    print("Battery not found")
    print("#FF0000")
    sys.exit(0)

line = battery_lines[0]

# Parse status and percent
#match = re.search(r": (\w+), (\d+)%", line)
match = re.search(r": ([\w ]+), (\d+)%", line)
if not match:
    print(line)
    print(line)
    print("#FF0000")
    sys.exit(0)

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
