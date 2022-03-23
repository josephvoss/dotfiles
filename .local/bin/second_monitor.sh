xrandr --output HDMI-1 --auto --above eDP-1
#feh --bg-scale ~/Pictures/Snowy-Wood.png
day-mode
MONITOR=HDMI-1 polybar example &
disown $!
