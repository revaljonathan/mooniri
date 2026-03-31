#!/bin/bash

options="Shutdown\nReboot\nLock\nSuspend\nLock and suspend\nLogout"

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
"Lock and suspend")
  swaylock -f && systemctl suspend
  ;;
Logout)
  niri msg action quit --skip-confirmation
  ;;
Suspend)
  systemctl suspend
  ;;
Lock)
  swaylock -f
  ;;
esac
