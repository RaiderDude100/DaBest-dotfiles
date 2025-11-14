#!/usr/bin/env bash

set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Setting up Chaotic AUR...${NC}"

# Ensure running as root
if [[ $EUID -ne 0 ]]; then
  echo -e "${RED}This script must be run as root.${NC}" >&2
  exit 1
fi

# Step 1: Import Chaotic AUR key
echo -e "${GREEN}Importing Chaotic AUR key...${NC}"
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB

# Step 2: Add Chaotic AUR mirrorlist
echo -e "${GREEN}Adding Chaotic AUR mirrorlist...${NC}"
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Step 3: Add Chaotic AUR repository to pacman.conf
echo -e "${GREEN}Configuring pacman to use Chaotic AUR...${NC}"
if ! grep -q "

\[chaotic-aur\]

" /etc/pacman.conf; then
  cat <<EOF >> /etc/pacman.conf

[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOF
else
  echo -e "${RED}Chaotic AUR already configured in pacman.conf.${NC}"
fi

# Step 4: Update package database
echo -e "${GREEN}Updating package database...${NC}"
pacman -Syu

echo -e "${GREEN}Chaotic AUR setup complete! You can now install packages from it.${NC}"
exit 0
