#!/bin/bash
while true; do
    # Get song info (Artist - Title)
    SONG=$(mpc current -f "[%artist% - ]%title%")
    [ -z "$SONG" ] && SONG="Paused"

    VOL=$(amixer get Master | grep -Po '\[\d+%\]' | head -n1 | tr -d '[]%')
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    TIME=$(date +"%H:%M")

    xsetroot -name " $SONG | VOL $VOL% | BAT $BAT% | $TIME "
    sleep 1s
done
