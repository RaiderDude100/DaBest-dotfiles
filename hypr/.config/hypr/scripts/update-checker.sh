#!/usr/bin/env bash

# Check for pacman updates
pacman_updates=$(checkupdates 2>/dev/null | wc -l)

# Check for flatpak updates
flatpak_updates=$(flatpak remote-ls --updates 2>/dev/null | wc -l)

# Total updates
total_updates=$((pacman_updates + flatpak_updates))

# Output for Waybar
if [ "$total_updates" -eq 0 ]; then
    echo "󰅠 0"
else
    echo "󰅢 $total_updates"
fi

