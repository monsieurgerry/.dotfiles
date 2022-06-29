#!/bin/sh

# A dwm_bar function that shows a discord icon if running.

# Maybe some expert could help me to optimize this.

dwm_discord () {
    RUNNING=$(ps aux | awk '{print $11}' | grep discord | awk 'NR==1')
    PS="discord"

    if [ "$RUNNING" = "discord" ]; then
        if [ "$IDENTIFIER" = "" ]; then
            STATUS="DISC"
        else
            STATUS=""
        fi
    if [ "$PS" = "discord" ]; then
            printf "%s%s" "$SEP1" "$STATUS"
            printf "%s\n" "$SEP2"
        else
            printf "%s%s" "$SEP1" "$STATUS"
        fi
    fi
}

dwm_discord
