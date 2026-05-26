#!/bin/bash

# Pick direction
DIRECTION=$(printf " English → Indonesian\n Indonesian → English" | rofi -dmenu -theme-str 'window { width: 350px; }' -p "Translate" -l 2)

case "$DIRECTION" in
*"English → Indonesian"*)
    LANG_PAIR="en:id"
    PROMPT="EN → ID"
    ;;
*"Indonesian → English"*)
    LANG_PAIR="id:en"
    PROMPT="ID → EN"
    ;;
*)
    exit 0 # User cancelled
    ;;
esac

# Enter the word
WORD=$(rofi -dmenu -p "$PROMPT" -l 0 <<<"")
[ -z "$WORD" ] && exit 0

# Translate using translate-shell
RESULT=$(trans -brief "$LANG_PAIR" "$WORD" 2>/dev/null)

# Send notification
notify-send "$WORD" "$RESULT" -t 30000
