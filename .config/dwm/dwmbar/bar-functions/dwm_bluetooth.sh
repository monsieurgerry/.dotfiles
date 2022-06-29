#!/bin/sh

# Funcion para mostar icono de bluetooth si esta prendido

dwm_bluetooth () {

    # POWER=$(bluetoothctl show | grep Powered | awk '{print $2}')
    POWER=$(bluetoothctl show 00:1A:7D:DA:71:11 | grep Powered | awk '{print $2}')
    PS="bluetooth"

    if [ "$POWER" = "yes" ]; then
        if [ "$IDENTIFIER" = "" ]; then
            STATUS=""
        else
            STATUS=""
        fi

    if [ "$PS" = "bluetooth" ]; then
            printf "%s%s" "$SEP1" "$STATUS"
            printf "%s\n" "$SEP2"
        else
            printf "%s%s" "$SEP1" "$STATUS"
        fi
    fi

}

dwm_bluetooth
