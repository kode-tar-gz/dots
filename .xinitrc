#!/bin/sh

# source .profile file for PATH variables
. ~/.profile
export QT_QPA_PLATFORMTHEME=qt5ct

emacs --daemon

xwallpaper --zoom /home/kode/Pictures/Wallpapers/1679798258668691.jpg

picom -b &

dunst &

# Status bar
while true; do
    NET=$(sb-network)
    CPU=$(sb-cpu)
    RAM=$(sb-memory)
    DISK=$(df -h / | awk 'NR==2 {print $3 "/" $2}')
    VOL=$(amixer get Master | awk -F'[][]' 'END{ print $2 }')
    DAT=$(date '+%b %d %H:%M')

    # 2. Print to the root window
    # \01 = Region 1 (Volume)
    # \02 = Region 2 (RAM)
    # The date has no bytes, so it is just plain text.
    xsetroot -name "$(printf ' \01%s \01|\02 %s \02|\03 %s \03|\04 ^c#fab795^ ^d^%s \04|\05 ^c#87ceeb^  ^d^%s \05| %s ' "$NET" "$CPU" "$RAM" "$DISK" "$VOL" "$DAT")"
    sleep 2
done &

# running and logging dwm
while true; do
    dwm 2> ~/logs/.dwm.log

    if [ -f /tmp/dwm.exit ]; then
        rm /tmp/dwm.exit
        break
    fi
done
