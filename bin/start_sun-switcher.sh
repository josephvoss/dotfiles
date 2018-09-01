#!/bin/bash

export DISPLAY=:0
export HOME=/home/jvoss14/
data="$(~/bin/sunwait -p 30.2672N 97.7431W | grep rises)"
data="$(~/bin/sunwait -p 36.0103N 84.2696W | grep rises)"
sun_up=$(echo $data | awk '{print $3}')
sun_down=$(echo $data | awk '{print $6}')
cur_time=$(date +%H%M)

if [ $cur_time -gt $sun_down ]; then
    ~/bin/night-mode;
    ~/bin/wal-set;
elif [ $cur_time -gt $sun_up ]; then
    ~/bin/day-mode;
    ~/bin/wal-set;
else
    ~/bin/night-mode;
    ~/bin/wal-set;
fi
