#!/usr/bin/env bash

ROFI_CMD="rofi -dmenu -i -theme-str 'window {width: 350;} listview {lines: 10;}'"

scan_networks() {
    nmcli --fields SSID,SECURITY,SIGNAL,IN-USE dev wifi list 2>/dev/null |
        tail -n +2 |
        sed 's/  */ /g' |
        sort -t' ' -k3 -rn
}

active_connections() {
    nmcli -t -f NAME,TYPE,DEVICE con show --active 2>/dev/null |
        grep -v ":loopback"
}

do_connect() {
    nmcli dev wifi rescan 2>/dev/null &

    local networks
    networks=$(scan_networks)

    local chosen
    chosen=$(echo "$networks" |
        eval "$ROFI_CMD -p 'Connect to network'" |
        awk '{print $1}')

    [[ -z "$chosen" ]] && return

    if nmcli -t -f NAME con show | grep -qx "$chosen"; then
        if nmcli con up "$chosen" &>/dev/null; then
            notify "Connected to $chosen"
        else
            notify "Failed to connect to $chosen"
        fi
        return
    fi

    local security
    security=$(echo "$networks" | awk -v ssid="$chosen" '$1==ssid {print $2}')

    local password=""
    if [[ "$security" != "--" && "$security" != "" ]]; then
        password=$(echo "" |
            rofi -dmenu -password \
                -theme-str 'window {width: 30%;}' \
                -p "Password for $chosen")
        [[ -z "$password" ]] && return
    fi

    if [[ -n "$password" ]]; then
        nmcli dev wifi connect "$chosen" password "$password" &>/dev/null &&
            notify "Connected to $chosen" ||
            notify "Failed to connect to $chosen"
    else
        nmcli dev wifi connect "$chosen" &>/dev/null &&
            notify "Connected to $chosen" ||
            notify "Failed to connect to $chosen"
    fi
}

do_disconnect() {
    local connections
    connections=$(active_connections)

    if [[ -z "$connections" ]]; then
        notify "No active connections"
        return
    fi

    local chosen
    chosen=$(echo "$connections" |
        eval "$ROFI_CMD -p 'Disconnect'" |
        cut -d: -f1)

    [[ -z "$chosen" ]] && return

    if nmcli con down "$chosen" &>/dev/null; then
        notify "Disconnected from $chosen"
    else
        notify "Failed to disconnect $chosen"
    fi
}

do_status() {
    local status wifi_status
    status=$(nmcli general status 2>/dev/null | tail -n +2 | head -1)
    wifi_status=$(nmcli radio wifi 2>/dev/null | tail -n +2 | head -1)

    local active
    active=$(active_connections | awk -F: 'NR==1{print $1}')
    [[ -z "$active" ]] && active="none"

    printf "Connected:  %s\nWiFi radio: %s\nStatus:     %s\n" \
        "$active" "$wifi_status" "$status" |
        rofi -dmenu -p "Network status" \
            -theme-str 'window {width: 35%;} entry {enabled: false;}' \
            >/dev/null
}

do_toggle_wifi() {
    local current
    current=$(nmcli radio wifi 2>/dev/null | tail -n +2 | awk '{print $1}')

    if [[ "$current" == "enabled" ]]; then
        nmcli radio wifi off && notify "WiFi disabled"
    else
        nmcli radio wifi on && notify "WiFi enabled"
    fi
}

do_vpn() {
    local vpns
    vpns=$(nmcli -t -f NAME,TYPE con show |
        awk -F: '$2~/vpn/{print $1}')

    if [[ -z "$vpns" ]]; then
        notify "No VPN connections configured"
        return
    fi

    local chosen
    chosen=$(echo "$vpns" |
        eval "$ROFI_CMD -p 'Toggle VPN'")

    [[ -z "$chosen" ]] && return

    if nmcli -t -f NAME,TYPE con show --active | grep -q "^$chosen:"; then
        nmcli con down "$chosen" && notify "VPN $chosen disconnected"
    else
        nmcli con up "$chosen" && notify "VPN $chosen connected" ||
            notify "Failed to start VPN $chosen"
    fi
}

notify() {
    if command -v notify-send &>/dev/null; then
        notify-send -i network-wireless "Network: $1"
    fi
}

MENU="  Connect\n  Disconnect\n  Status\n  Toggle WiFi\n  VPN"

choice=$(printf "$MENU" |
    eval "$ROFI_CMD -p 'Network'")

case "$choice" in
*"Connect") do_connect ;;
*"Disconnect") do_disconnect ;;
*"Status") do_status ;;
*"Toggle WiFi") do_toggle_wifi ;;
*"VPN") do_vpn ;;
*) exit 0 ;;
esac
