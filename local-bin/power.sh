#!/bin/bash

options="Shutdown\nReboot\nLock\nSuspend now\nDo not suspend\nAllow suspend\nLogout"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power" \
    -theme-str '
    window { width: 300px; }
    element selected {
      background-color: #ffffff;
      text-color: #ffffff;
      accent-color: #fca7ea;
    }
  ')

case "$chosen" in
Shutdown)
    systemctl poweroff
    ;;
Reboot)
    systemctl reboot
    ;;
"Do not suspend")
    pkill swayidle
    notify-send "you just disable automatic suspend"
    ;;
"Allow suspend")
    pkill swayidle 2>/dev/null
    ~/.local/bin/sleep.sh
    ;;
Logout)
    niri msg action quit --skip-confirmation
    ;;
"Suspend now")
    systemctl suspend
    ;;
Lock)
    swaylock -f
    ;;
esac
