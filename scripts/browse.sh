#!/usr/bin/env bash

PREDEFINED=(
  "gmail.com"
  "calendar.google.com"
  "github.com"
  "Wikipedia: "
  "Youtube: "
  "Tokopedia: "
  "Arch Wiki: "
  "Deepseek: "
)

CHOICE=$(printf '%s\n' "${PREDEFINED[@]}" | rofi \
  -dmenu \
  -columns 2 \
  -lines 4 \
  -p "🔍 Search" \
  -theme-str 'window {width: 450px;}' \
  -i \
  -kb-accept-entry "Return" \
  -mesg "Type to search or pick")

[ -z "$CHOICE" ] && exit 0

urlencode() {
  python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1]))" "$1"
}

case "$CHOICE" in
*gmail*) brave "https://mail.google.com" ;;
*calendar*) brave "https://calendar.google.com" ;;
*github*) brave "https://github.com" ;;
"Wikipedia: "*) brave "https://en.wikipedia.org/wiki/Special:Search?search=$(urlencode "${CHOICE#Wikipedia: }")" ;;
"Youtube: "*) brave "https://www.youtube.com/" ;;
"Tokopedia: "*) brave "https://www.tokopedia.com/" ;;
"Arch Wiki: "*) brave "https://wiki.archlinux.org/title/Main_page" ;;
"Deepseek: "*) brave "https://chat.deepseek.com/" ;;
*) brave "https://www.google.com/search?q=$(urlencode "$CHOICE")" ;;
esac
