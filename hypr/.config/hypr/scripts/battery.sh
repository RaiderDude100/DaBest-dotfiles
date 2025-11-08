#!/usr/bin/env bash
 
if [ ! -d /sys/class/power_supply/BAT1 ]; then
	exit 0
fi

battery_percentage=$(cat /sys/class/power_supply/BAT1/capacity)
battery_status=$(cat /sys/class/power_supply/BAT1/status)

battery_icons=("󰂃" "󰁻" "󰁽" "󰁿" "󰂁" "󰁹")
charging_icon="󰂄"

icon_index=$((battery_percentage / 20))
battery_icon=${battery_icons[icon_index]}
k
if [ "$battery_status" = "Charging" ]; then
	battery_icon="$charging_icon"
fi

echo "$battery_icon $battery_percentage%"
