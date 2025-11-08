#!/bin/sh

exec sudo pacman -S --needed git base-devel
exec git clone https://aur.archlinux.org/yay.git
cd yay
exec makepkg -si

