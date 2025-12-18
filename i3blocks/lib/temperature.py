#!/usr/bin/env python3
import subprocess
import sys
import re

# Default values
chip = "coretemp-isa-0000"
temperature = -9999

# Get temperature from sensors
try:
    output = subprocess.check_output(["sensors", "-u", chip], text=True)
except subprocess.CalledProcessError:
    print("<span foreground='red'>Cannot read sensors</span>")
    sys.exit(1)

match = re.search(r"^\s*temp1_input:\s*([\-+]?\d+\.\d+)", output, re.MULTILINE)
if match:
    temperature = float(match.group(1))
else:
    print("<span foreground='red'>Cannot find temperature</span>")
    sys.exit(1)

# Determine color
if temperature <= 50:
    color = "#00FF00"
elif 50 < temperature < 60:
    color = "#FFFC00"
else:  # 60 and above
    color = "#FF0000"

# Print with Pango markup for i3blocks
print(f"<span foreground='{color}'>{temperature:.0f}°C</span>")  # short_text

# Optional: set exit code 33 if critical
if color == "red":
    sys.exit(33)

sys.exit(0)
