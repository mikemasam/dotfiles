#!/usr/bin/env python3
import os
import sys
import subprocess

metadata = []
player_arg = ""

BLOCK_INSTANCE = os.getenv("BLOCK_INSTANCE")
BLOCK_BUTTON = os.getenv("BLOCK_BUTTON")

if len(sys.argv) > 1 and sys.argv[1] == "control":
    BLOCK_BUTTON = "1" 

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
    title = run_cmd(f"playerctl {player_arg} metadata title")
    artist = run_cmd(f"playerctl {player_arg} metadata artist")
    rofi = subprocess.Popen(['rofi', '-dmenu', '-p', f"Playing {title or 'None'} by {artist or 'None'}"], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    selected, _ = rofi.communicate(input=rofi_input.encode())
    return selected.decode().strip()
# Handle mouse buttons
if BLOCK_BUTTON == "1":
    options = ['Play-Pause(a)', 'Next(n)', 'Previous(r)']
    selected = rofi_select(options)
    if selected == "Play-Pause(a)":
        subprocess.run(f"playerctl {player_arg} play-pause", shell=True)
    if selected == "Previous(r)":
        subprocess.run(f"playerctl {player_arg} previous", shell=True)
    if selected == "Next(n)":
        subprocess.run(f"playerctl {player_arg} next", shell=True)

status = run_cmd(f"playerctl {player_arg} status")
if status == 'Playing':
    status = '▶'
elif status == 'Paused':
    status = '𝄽'
# Use playerctl to get artist and title
artist = run_cmd(f"playerctl {player_arg} metadata artist")
title = run_cmd(f"playerctl {player_arg} metadata title")
if artist or title:
    print(f" <b>{status} {artist or '^'} - {title or '^'}</b>".strip(" -"))
