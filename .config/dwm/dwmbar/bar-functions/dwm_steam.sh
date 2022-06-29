#!/bin/sh

# Funcion que muestra icono de steam

dwm_steam () {
  isOpen=$(ps aux | awk '{print $11}' | grep steam | awk 'NR==1' | cut -c 44-)

  if [ "$isOpen" = "steam" ]; then
    STATUS=""
    printf "%s%s" "$SEP1" "$STATUS"
    printf "%s\n" "$SEP2"
  fi
}

dwm_steam
