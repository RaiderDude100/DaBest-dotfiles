#!/bin/sh

# The package name you're building
PACKAGE_NAME="yay"

# Check if the package is already installed
if pacman -Q $PACKAGE_NAME > /dev/null 2>&1; then
    echo "$PACKAGE_NAME is already installed. Skipping installation."
else
    # Package is not installed, so build and install
    echo "$PACKAGE_NAME is not installed. Building and installing..."
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    echo "yay installed"
fi

exit 0

