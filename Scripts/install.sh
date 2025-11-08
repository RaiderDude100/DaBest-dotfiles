#!/bin/sh

PATH="~/dotfiles"
if [ -d "$FOLDER_PATH" ]; then
  echo "Already downloaded"
  cd Install
  chmod +x *
  ./install-yay.sh
  ./install-chaotic-aur.sh
  ./install-themeing.sh
  ./install-utilities.sh

  cd ..
  cd ..
  stow btop fastfetch gamemode gtk-2 gtk-3 gtk-4 hypr kitty matugen nwg-look qt5ct qt6ct rofi swaync vim wallust waybar zed zsh

  cd Scripts
  cd Install
  ./install-programs.sh

  cd ..
  cd Theme
  chmod +x theme.sh
  ./theme.sh

  cd Post
  chmod +x *
  ./post.sh

  
else
  echo "Downloading from github"
  git clone https://github.com/RaiderDude100/dotfiles.git
  cd dotfiles
  cd Install
  chmod +x *
  ./install-yay.sh
  ./install-chaotic-aur.sh
  ./install-themeing.sh
  ./install-utilities.sh

  cd ..
  cd ..
  stow btop fastfetch gamemode gtk-2 gtk-3 gtk-4 hypr kitty matugen nwg-look qt5ct qt6ct rofi swaync vim wallust waybar zed zsh

  cd Scripts
  cd Install
  ./install-programs.sh

  cd ..
  cd Theme
  chmod +x theme.sh
  ./theme.sh

  cd Post
  chmod +x *
  ./post.sh
  
fi

