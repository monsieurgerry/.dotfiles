#!/bin/sh

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP using NetworkManager
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, curl

dwm_networkmanager () {
    printf "%s" "$SEP1"
    CONNAME=$(nmcli -a | awk 'NR==1' | cut -c -4)
    ACTIVE=$(nmcli -t -f active,ssid dev wifi | grep yes | cut -c -3)
    NET=$(nmcli -t -f active,ssid dev wifi | grep yes | cut -c 5-)
    if [ "$CONNAME" = "eth0" ]; then
        printf ""
    elif [ "$ACTIVE" = "yes" ]; then
        printf ""
    else
      printf "睊"
    fi
    printf "%s\n" "$SEP2"
}

dwm_networkmanager
