#!/bin/sh

set -e

cd "$(dirname "$0")"

cd Theme
chmod +x theme.sh
./theme.sh

cd ../Install
chmod +x install-yay.sh install-chaotic-aur.sh install-themeing.sh install-utilities.sh install-flatpaks.sh
./install-yay.sh
sudo ./install-chaotic-aur.sh
./install-themeing.sh
./install-utilities.sh
./install-flatpaks.sh

cd ../..
stow --override btop fastfetch gamemode gtk-2 gtk-3 gtk-4 hypr kitty matugen nwg-look qt5ct qt6ct rofi swaync vim wallust waybar zed zsh wallpaper

cd Scripts/Install
chmod +x install-programs.sh
./install-programs.sh

cd ../Post
chmod +x post.sh
./post.sh

echo "Done"
exit 0
