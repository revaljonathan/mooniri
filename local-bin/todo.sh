#!/usr/bin/env bash
# todo.sh — rofi-based todo list with time-based notifications
# Dependencies: rofi, notify-send, jq

TASKS_FILE="$HOME/.todo_tasks.json"

# Init file if missing
[ -f "$TASKS_FILE" ] || echo "[]" >"$TASKS_FILE"

ACTION=$(printf " Add task\n View tasks\n Delete task" | rofi -dmenu -p "Todo" -theme-str 'window {width: 400px;}')

case "$ACTION" in

" Add task")
    TASK_NAME=$(rofi -dmenu -p "Task name" -theme-str 'window {width: 800px;}')
    [ -z "$TASK_NAME" ] && exit 0

    TASK_TIME=$(rofi -dmenu -p "Notify at (HH:MM)" -theme-str 'window {width: 400px;}')

    # Validate time format if provided
    if [ -n "$TASK_TIME" ] && ! echo "$TASK_TIME" | grep -qE '^([01][0-9]|2[0-3]):[0-5][0-9]$'; then
        notify-send "Todo" "Invalid time format. Use HH:MM (e.g. 09:30)" -i dialog-warning
        exit 1
    fi

    # Append to JSON
    ENTRY=$(jq -n \
        --arg name "$TASK_NAME" \
        --arg time "$TASK_TIME" \
        --arg notified "false" \
        '{name: $name, time: $time, notified: $notified}')

    jq ". += [$ENTRY]" "$TASKS_FILE" >/tmp/todo_tmp.json && mv /tmp/todo_tmp.json "$TASKS_FILE"
    notify-send "Todo" "Added: $TASK_NAME${TASK_TIME:+ at $TASK_TIME}" -i appointment-new
    ;;

" View tasks")
    DISPLAY=$(jq -r '.[] | if .time != "" then "[\(.time)] \(.name)" else "[ no time ] \(.name)" end' "$TASKS_FILE")
    [ -z "$DISPLAY" ] && DISPLAY="No tasks yet."
    echo "$DISPLAY" | rofi -dmenu -p "Tasks (read-only)" -no-custom -theme-str 'window {width: 500px;}'
    ;;

" Delete task")
    # Build menu: index + label
    ENTRIES=$(jq -r 'to_entries[] | "\(.key)  \(if .value.time != "" then "[\(.value.time)] " else "" end)\(.value.name)"' "$TASKS_FILE")
    [ -z "$ENTRIES" ] && {
        notify-send "Todo" "No tasks to delete." -i dialog-information
        exit 0
    }

    SELECTED=$(echo "$ENTRIES" | rofi -dmenu -p "Delete task" -theme-str 'window {width: 500px;}')
    [ -z "$SELECTED" ] && exit 0

    INDEX=$(echo "$SELECTED" | awk '{print $1}')
    jq "del(.[${INDEX}])" "$TASKS_FILE" >/tmp/todo_tmp.json && mv /tmp/todo_tmp.json "$TASKS_FILE"
    notify-send "Todo" "Task deleted." -i edit-delete
    ;;

esac
