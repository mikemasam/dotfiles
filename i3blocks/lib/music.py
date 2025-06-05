#!/usr/bin/env python3
import os
import sys
import subprocess

metadata = []
player_arg = ""

BLOCK_INSTANCE = os.getenv("BLOCK_INSTANCE")
BLOCK_BUTTON = os.getenv("BLOCK_BUTTON")

if BLOCK_INSTANCE:
    player_arg = f"--player={BLOCK_INSTANCE}"

def run_cmd(cmd):
    try:
        result = subprocess.run(cmd, shell=True, check=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
        return result.stdout.strip()
    except subprocess.CalledProcessError:
        return None

def rofi_select(options):
    rofi_input = '\n'.join(f"{label}" for label in options)
    rofi = subprocess.Popen(['rofi', '-dmenu', '-p', 'Music'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    selected, _ = rofi.communicate(input=rofi_input.encode())
    return selected.decode().strip()
# Handle mouse buttons
if BLOCK_BUTTON == "1":
    options = ['Play-Pause', 'Next', 'Previous']
    selected = rofi_select(options)
    if selected == "Play-Pause":
        subprocess.run(f"playerctl {player_arg} play-pause", shell=True)
    if selected == "Previous":
        subprocess.run(f"playerctl {player_arg} previous", shell=True)
    if selected == "Next":
        subprocess.run(f"playerctl {player_arg} next", shell=True)

# Try cmus if no player_arg or ends with 'cmus'
if not player_arg or player_arg.endswith("cmus"):
    cmus_output = run_cmd("cmus-remote -Q")
    if cmus_output:
        artist = None
        title = None
        for line in cmus_output.splitlines():
            parts = line.split()
            if len(parts) >= 3 and parts[0] == "tag":
                key = parts[1]
                value = " ".join(parts[2:])
                if key == "artist":
                    artist = value
                elif key == "title":
                    title = value
        if artist or title:
            print(f"{artist or ''} - {title or ''}".strip(" -"))
            sys.exit(0)
    # If player_arg is 'cmus' exit here
    if player_arg.endswith("cmus"):
        sys.exit(0)

# Use playerctl to get artist and title
artist = run_cmd(f"playerctl {player_arg} metadata artist")
if artist is None:
    sys.exit(0)
title = run_cmd(f"playerctl {player_arg} metadata title")
if title is None:
    sys.exit(0)

if artist or title:
    print(f" <b>🎵{artist or ''} - {title or ''}</b>".strip(" -"))
