#!/bin/sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo usermod -aG gamemode $(whoami)
sudo reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist -p https
yay -Syu --noconfirm
waypaper --random

echo "Post installation scripts finished"
exit
