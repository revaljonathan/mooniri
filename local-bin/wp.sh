#!/usr/bin/env bash
WALLPAPER_DIR="$HOME/pics/walls/"
COLUMNS=4
THUMB_SIZE=175
TMPFILE=$(mktemp)

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
fi
