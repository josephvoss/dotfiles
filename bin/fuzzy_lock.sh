#!/bin/sh -ei

# Take a screenshot
#scrot /tmp/screen_locked.png

# Pixellate it 10x
# Or blur
#convert /tmp/screen_locked.png -blur 0x6 /tmp/screen_locked.png

# Lock screen displaying this image.
#i3lock -i /tmp/screen_locked.png -n

# Turn the screen off after a delay.
##sleep 60; pgrep i3lock && xset dpms force off

icon="$HOME/Pictures/lock.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
#i3lock -u -i "$tmpbg"
i3lock  -i "$tmpbg"

