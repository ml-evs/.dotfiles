#!/bin/sh
if [ ! "$DUNST_APP_NAME" = "tidal-hifi" ]; then
    echo $DUNST_APP_NAME
    paplay /home/mevans/downloads/pda.mp3
fi
