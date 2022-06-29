#!/bin/sh

# Funcion que muestra icono firefox si abierto (en mi caso brave jeje)

dwm_explorer () {
    RUNNING=$(ps aux | awk '{print $11}' | grep brave | awk 'NR==1' | cut -c 20-)
    CHROME=$(ps aux | awk '{print $11}' | grep chromium | cut -c 19- | awk 'NR==1')

    if [ "$RUNNING" = "brave" ]; then
        if [ "$IDENTIFIER" = "" ]; then
            STATUS="DISC"
        else
            STATUS=""
        fi
        printf "%s%s" "$SEP1" "$STATUS"
    fi

    if [ "$CHROME" = "chromium" ]; then
        if [ "$IDENTIFIER" = "" ]; then
            BROW="DISC"
        else
            BROW=""
        fi
        printf "%s%s" "$SEP2" "$BROW"
    fi
    printf "%s\n" "$SEP2"
}

dwm_explorer
