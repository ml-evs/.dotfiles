#!/bin/sh
# Toggle the focused window between tiled and a centered floating 1920x1200
# "virtual laptop monitor" — guards against accidentally maximizing across
# the full 5120px ultrawide.

state=$(swaymsg -t get_tree | jq -r '
    .. | objects | select(.focused? == true) | .type
')

if [ "$state" = "floating_con" ]; then
    swaymsg floating disable
else
    swaymsg floating enable
    swaymsg resize set 1920 1200
    swaymsg move position center
fi
