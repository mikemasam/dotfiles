#!/bin/bash

xfce4-screenshooter -s /tmp/lock-screenshot.png -f
convert /tmp/lock-screenshot.png -blur 0x5 -fill "rgba(0,0,0,0.35)" -draw "rectangle 0,0 1920,1080" /tmp/lock-screenshot-blur.png

i3lock -i /tmp/lock-screenshot-blur.png -n -t
