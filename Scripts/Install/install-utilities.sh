#!/bin/sh

yay -S polkit polkit-gnome polkit-qt6 7zip android-file-transfer android-udev aquamarine auto-cpufreq bat blueman bluez bluez-libs bluez-obex bluez-utils brightnessctl btop eza gamemode lib32-gamemode grim gtk gtk2 gtk3 gtk4 imagemagick ly ncdu ntfs-3g pacseek pavucontrol qdiskinfo-bin stow tumbler zoxide zsh reflector resources --needed --noconfirm

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Installed utilities"
exit
