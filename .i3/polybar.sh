#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.1; done

polybar -r mine &
polybar -r laptop &
polybar -r vert &
polybar -r ext1 &
polybar -r ext &
polybar -r ext2 &
polybar -r ext4

# for m in $(polybar -m | awk '{gsub(":", "", $1); print $1}'); do
#     MONITOR=$m polybar -r mine &
# done
