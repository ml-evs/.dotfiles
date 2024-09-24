#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.1; done

polybar -r mine &

split_monitors=$(xrandr --listmonitors | grep -q "~" && true || false);

if $split_monitors; then
    polybar -r main-splits &
    polybar -r splits-1  &
    polybar -r splits-2
else
    echo "No splits"
    polybar -r ext2 &
fi

## for m in $(polybar -m | awk '{gsub(":", "", $1); print $1}'); do
#     MONITOR=$m polybar -r mine &
# done
