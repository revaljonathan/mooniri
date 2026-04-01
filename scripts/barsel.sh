#!/bin/bash

OPTIONS="verbose\nverbose-pacman\nverbose-less\nminimal\nisland"

CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "Waybar Mode" \
  -theme-str 'window {width: 250px;}')

[ -z "$CHOICE" ] && exit 0

pkill waybar

case "$CHOICE" in
verbose)
  waybar -c ~/.config/waybar/config -s ~/.config/waybar/style.css &
  ;;
verbose-pacman)
  waybar -c ~/.config/waybar/verbpack.jsonc -s ~/.config/waybar/verbpac.css &
  ;;
verbose-less)
  waybar -c ~/.config/waybar/verbose-less.jsonc -s ~/.config/waybar/style.css &
  ;;
minimal)
  waybar -c ~/.config/waybar/smol.jsonc -s ~/.config/waybar/smol.css &
  ;;

island)
  waybar -c ~/.config/waybar/separated.jsonc -s ~/.config/waybar/separated.css &
  ;;

esac

echo "$CHOICE" >/tmp/waybar_state
