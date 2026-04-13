#!/usr/bin/env bash
WALLPAPER_DIR="$HOME/pics/walls/" # 👈 change this
COLUMNS=4                         # 👈 columns in the grid
THUMB_SIZE=175                    # 👈 thumbnail size in px
TMPFILE=$(mktemp)
SARCASTIC_QUOTES=(
  "Wow, a new wallpaper. Your productivity will surely skyrocket now. "
  "Bold move. That'll definitely fix all your problems. "
  "Another wallpaper? This is basically a personality now. "
  "Yes, THIS is the wallpaper that will change your life. Obviously. "
  "Incredible. You've moved pixels around. Tell me more about this achievement. "
  "A new wallpaper won't make you reply to those emails, you know. "
  "Revolutionary. Truly, you are an artist of desktop customization. "
  "Great, now stare at it for 30 seconds before minimizing everything anyway. "
  "Wow. Different background. You must feel like a whole new person. "
  "Sure, *this* wallpaper is the one. Not like the last 47 you tried. "
  "Ah yes, the classic 'change wallpaper instead of being productive' move. Classic. "
  "This will look great behind all your open windows you never close. "
)
RANDOM_QUOTE="${SARCASTIC_QUOTES[$RANDOM%${#SARCASTIC_QUOTES[@]}]}"

find "$WALLPAPER_DIR" -maxdepth 1 -type f \
  \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) |
  sort >"$TMPFILE"

INDEX=$(
  cat "$TMPFILE" |
    while read -r filepath; do
      printf ' \x00icon\x1f%s\n' "$filepath"
    done |
    rofi \
      -dmenu \
      -i \
      -p "" \
      -show-icons \
      -format i \
      -theme-str "
            window {
                width: 900px;
                border-radius: 16px;
            }
            mainbox {
                padding: 12px;
                spacing: 8px;
            }
            inputbar {
                padding: 10px 14px;
                border-radius: 10px;
            }
            listview {
                columns: $COLUMNS;
                lines: 3;
                fixed-height: false;
                flow: horizontal;
                spacing: 8px;
            }
            element {
                orientation: vertical;
                padding: 4px;
                border-radius: 10px;
                spacing: 0px;
            }
            element-icon {
                size: ${THUMB_SIZE}px;
                border-radius: 8px;
            }
            element-text {
                font: \"Sans 0\";
                padding: 0;
                margin: 0;
            }
            element selected {
                border-radius: 10px;
            }
        "
)

[ -z "$INDEX" ] && {
  rm "$TMPFILE"
  exit 0
}
SELECTED=$(sed -n "$((INDEX + 1))p" "$TMPFILE")
rm "$TMPFILE"

if [ -n "$SELECTED" ]; then
  # Kill any existing swaybg instance
  pkill swaybg
  echo "$SELECTED" >"$HOME/.config/wallpaper"
  swaybg -m fill -i "$SELECTED" &
  notify-send "$RANDOM_QUOTE" --icon=preferences-desktop-wallpaper
fi
