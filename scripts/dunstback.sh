#!/bin/bash
ACTION=$1 # up | down

case $ACTION in
up)
  brightnessctl set 5%+
  ;;
down)
  brightnessctl set 5%-
  ;;
esac

# Get current brightness percentage
BRIGHTNESS=$(brightnessctl get)
MAX=$(brightnessctl max)
PERCENT=$((BRIGHTNESS * 100 / MAX))

dunstify -a "brightness" \
  -h string:x-dunst-stack-tag:brightness \
  -h int:value:"$PERCENT" \
  -t 1500 \
  -r 9992 \
  "Brightness — $PERCENT%"
