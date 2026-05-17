#!/bin/sh
# Toggle kanshi between the home (external + laptop) and laptop-only profiles.
# Bound to XF86Display so the laptop's monitor key flips between modes —
# useful when a KVM is hiding hotplug events from the compositor.

current=$(kanshictl status 2>/dev/null | awk '/^Current profile/{print $3}')

case "$current" in
    laptop) kanshictl switch home   ;;
    *)      kanshictl switch laptop ;;
esac
