#!/bin/bash
# rofi-hyprland-window-switcher.sh

# Get all windows with workspace ID and title using hyprctl
windows=$(hyprctl clients -j | jq -r '.[] | "\(.workspace.id) — \(.title)"')

# Let user select via rofi
selection=$(echo "$windows" | rofi -dmenu -i -p "Select Window")

# Debugging: Show selected entry
echo "You selected: $selection"

# Extract workspace ID and title from the selection
workspace_id=$(echo "$selection" | awk '{print $1}')
window_title=$(echo "$selection" | sed 's/^[0-9]\+ — //')  # Remove workspace ID and get the rest as the title

# Debugging: Show extracted values
echo "Workspace ID: $workspace_id"
echo "Window Title: $window_title"

# Find the window address based on the selected workspace ID and window title
window_address=$(hyprctl clients -j | jq -r --arg workspace_id "$workspace_id" --arg window_title "$window_title" \
    '.[] | select(.workspace.id == ($workspace_id | tonumber)) | select(.title == $window_title) | .address')

# Debugging: Show the window address found
echo "Window Address: $window_address"

# Focus the window based on the address
if [ -n "$window_address" ]; then
    hyprctl dispatch focuswindow address:$window_address
else
    echo "No window selected or window not found!"
fi

