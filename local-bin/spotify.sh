#!/bin/bash

status=$(playerctl -p spotify status 2>/dev/null)

if [ "$status" = "Playing" ]; then
  artist=$(playerctl -p spotify metadata artist)
  title=$(playerctl -p spotify metadata title)
  echo " $artist - $title"
elif [ "$status" = "Paused" ]; then
  artist=$(playerctl -p spotify metadata artist)
  title=$(playerctl -p spotify metadata title)
  echo " $artist - $title"
else
  echo ""
fi
