#!/bin/sh

ICON_DIR="$HOME/.local/share/icons"

# Check if directory exists
if [ ! -d "$ICON_DIR" ]; then
    echo "Directory does not exist. Creating $ICON_DIR..."
    mkdir -p "$ICON_DIR"
    echo "Directory created."
else
    echo "Directory already exists: $ICON_DIR"
fi

mv kora "$ICON_DIR/"
mv Bibata-Modern-Ice "$ICON_DIR/"

mv wallpaper "$HOME/"

echo "Theme files copied"
exit 0
