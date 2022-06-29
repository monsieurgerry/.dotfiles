#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Date is formatted like like this: "[Mon 01-01-00 00:00:00]"
dwm_date () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "" ]; then
        printf "📆 %s" "$(date "+%a %d-%m-%y %T")"
    else
        # printf "%s" "$(date "+%d-%m-%y (%a)")"
        printf "%s" "$(date "+%a, %b %d ")"
        printf "%s %s" "$SEP1" "$(date "+%H:%M ")"
    fi
    printf "%s\n" "$SEP2"
}

dwm_date
