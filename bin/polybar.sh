#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

echo "hi $(date)" > /tmp/frick

wal -t -R -a 75 -o ~/bin/wal-set

xrdb -query

# Launch polybar
/usr/local/bin/polybar -l info example 2>&1 >> /tmp/frick &
echo "bye $(date)" >> /tmp/frick
