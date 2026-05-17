#!/bin/sh
# Toggle scratchpad and, if a scratchpad window is now visible, resize and
# center it. Avoids the default behaviour of restoring whatever (potentially
# huge) size the window had when sent to scratchpad.

W=${1:-1200}
H=${2:-800}

swaymsg scratchpad show

# After `scratchpad show`, the focused window is the one just summoned —
# but only if a scratchpad window actually became visible. Check via the
# focused container's `scratchpad_state`.
state=$(swaymsg -t get_tree | jq -r '
    .. | objects | select(.focused? == true) | .scratchpad_state // "none"
')

if [ "$state" != "none" ]; then
    swaymsg resize set "$W" "$H"
    swaymsg move position center
fi
