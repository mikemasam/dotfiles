#!/usr/bin/env python3
import os
import subprocess

SINK = "@DEFAULT_SINK@"
STEP = "5%"

def run(cmd):
    return subprocess.check_output(cmd).decode().strip()

def get_volume():
    out = run(["pactl", "get-sink-volume", SINK])
    vol = out.split()[4]
    return int(vol.replace("%",""))

def is_muted():
    out = run(["pactl", "get-sink-mute", SINK])
    return "yes" in out

def cap_volume():
    vol = get_volume()
    if(vol > 130):
        run(["pactl", "set-sink-volume", SINK, "100%"])
        run(["notify-send", "i3Block", "Volume above 130 damage speaker"])

button = os.environ.get("BLOCK_BUTTON")
cap_volume()
if button == "3":
    run(["pactl", "set-sink-mute", SINK, "toggle"])

elif button == "4":
    run(["pactl", "set-sink-volume", SINK, f"-{STEP}"])

elif button == "5":
    run(["pactl", "set-sink-volume", SINK, f"+{STEP}"])


if is_muted():
    print("🔇 MUTE")
else:
    vol = get_volume()
    if vol < 30:
        icon = "🔈"
    elif vol < 70:
        icon = "🔉"
    else:
        icon = "🔊"

    print(f"{vol}%")
