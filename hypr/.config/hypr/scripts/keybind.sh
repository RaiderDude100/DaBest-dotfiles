#!/usr/bin/env bash

# Path to your Hyprland keybind config
KEYBINDS_FILE="$HOME/.config/hypr/conf/keybinds.conf"

# Parse variable definitions (like $mainMod, $terminal, etc.)
declare -A vars
while IFS='=' read -r key value; do
    key=$(echo "$key" | xargs)   # trim spaces
    value=$(echo "$value" | xargs | sed 's/#.*//') # trim spaces and comments
    [[ $key == \$* ]] && vars["$key"]="$value"
done < <(grep -E '^\s*\$' "$KEYBINDS_FILE")

# Extract keybind lines and replace variables
keybinds=$(grep -E "^\s*bind|^\s*bindm|^\s*bindel" "$KEYBINDS_FILE" | \
    while IFS= read -r line; do
        for k in "${!vars[@]}"; do
            line=${line//${k}/${vars[$k]}}
        done
        echo "$line"
    done | \
    sed -E 's/^\s*bind(el|m)?\s*=\s*//g' | \
    awk -F',' '{
        key=$1; shortcut=$2; action=$3; command=$4;
        gsub(/^[ \t]+|[ \t]+$/, "", key);
        gsub(/^[ \t]+|[ \t]+$/, "", shortcut);
        gsub(/^[ \t]+|[ \t]+$/, "", action);
        gsub(/^[ \t]+|[ \t]+$/, "", command);
        print key " + " shortcut " → " action " " command
    }'
)

# Show in rofi
echo "$keybinds" | rofi -dmenu -i -p "Hyprland Keybinds"

