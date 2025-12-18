#!/usr/bin/env python3
import subprocess
import re

t_warn = 50
t_crit = 80
cpu_usage = -1

try:
    output = subprocess.check_output(["mpstat", "1", "1"], text=True, env={"LC_ALL": "en_US"})
except subprocess.CalledProcessError:
    print("<span foreground='red'>Cannot read CPU</span>")
    exit(1)

match = re.search(r"^Average.*\s+(\d+\.\d+)", output, re.MULTILINE)
if match:
    cpu_usage = 100 - float(match.group(1))
else:
    print("<span foreground='red'>Cannot find CPU info</span>")
    exit(1)

# Determine color
if cpu_usage >= t_crit:
    color = "#FF0000"
elif cpu_usage >= t_warn:
    color = "#FFFC00"
else:
    color = "#00FF00"

print(f"<span foreground='{color}'> : {cpu_usage:.1f}%</span>")
exit(0)
