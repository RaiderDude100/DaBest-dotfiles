#!/bin/sh

PATH="~/dotfiles"
if [ -d "$FOLDER_PATH" ]; then
  echo "Already downloaded"
  cd Scripts
  ./install.sh

  
else
  echo "Downloading from github"
  git clone https://github.com/RaiderDude100/dotfiles.git
  cd dotfiles
  cd Scripts
  ./install.sh
  
fi

