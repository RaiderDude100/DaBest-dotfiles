#!/bin/sh

FOLDER_PATH="$HOME/dotfiles"
cd "$HOME"

if [ -d "$FOLDER_PATH" ]; then
  echo "Already downloaded"
else
  echo "Downloading from GitHub"
  git clone https://github.com/RaiderDude100/dotfiles.git
fi

cd "$FOLDER_PATH/Scripts"
./install.sh

echo "Please restart for effects to take place"
exit 0
