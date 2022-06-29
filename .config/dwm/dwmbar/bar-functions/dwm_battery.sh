#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "" ]; then
        if [ "$STATUS" = "Charging" ]; then
            printf " %s%%" "$CHARGE"
        else
            printf " %s%%" "$CHARGE"
        fi
    else
        if [ "$STATUS" = "Charging" ]; then
            if [ "$CHARGE" -gt 90 ]; then
                printf "%s%% " "$CHARGE"
            else
                printf "%s%% " "$CHARGE"
            fi
        else
            # if [ "$CHARGE" -le 20 ]; then
            #     printf "%s%% " "$CHARGE"
            # elif [ "$CHARGE" -le 40 ]; then
            #     printf "%s%% " "$CHARGE"
            # elif [ "$CHARGE" -le 60 ]; then
            #     printf "%s%% " "$CHARGE"
            # elif [ "$CHARGE" -le 80 ]; then
            #     printf "%s%% " "$CHARGE"
            # elif [ "$CHARGE" -le 100 ]; then
            #     printf "%s%% " "$CHARGE"

            # No numbers
            if [ "$CHARGE" -le 20 ]; then
                printf ""
            elif [ "$CHARGE" -le 40 ]; then
                printf ""
            elif [ "$CHARGE" -le 60 ]; then
                printf ""
            elif [ "$CHARGE" -le 80 ]; then
                printf ""
            elif [ "$CHARGE" -le 100 ]; then
                printf ""
            fi
        fi
    fi

    printf "%s\n" "$SEP2"
}

dwm_battery

