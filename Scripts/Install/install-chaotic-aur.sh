#!/bin/bash
set -e

# Colors
Green='\033[0;32m'
NC='\033[0m'

# Functions
chaotic_aur_mirrorlist_setup() {
    echo ""
    wget -q -O chaotic-mirrorlist "https://raw.githubusercontent.com/chaotic-aur/pkgbuild-chaotic-mirrorlist/main/mirrorlist"
    sudo mv chaotic-mirrorlist /etc/pacman.d/chaotic-mirrorlist
}

system_update() {
    sudo pacman -Syu chaotic-keyring
}

check_mirror_exists() {
    if [[ -f "/etc/pacman.d/chaotic-mirrorlist" ]]; then
        echo -e "\n${Green}Chaotic AUR is successfully installed.${NC}"
        echo -e "${Green}Checking for system update with keyring...${NC}\n"
        system_update
    else
        echo -e "\n${Green}Mirrorlist is not installed.${NC}"
        echo -e "${Green}Attempting manual installation...${NC}\n"
        chaotic_aur_mirrorlist_setup || { echo "Failed to set up mirrorlist"; exit 1; }
        check_mirror_exists
    fi
}

config_file_append() {
    echo -e "#Chaotic-AUR\n\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null
    check_mirror_exists
}

make_sure_system_is_updated() {
    echo -e "${Green}Updating system to avoid unknown errors...${NC}"
    sudo pacman -Syu
}

install_chaotic_aur() {
    echo -e "${Green}This process requires superuser permission. Please review the script before proceeding.${NC}"
    make_sure_system_is_updated

    sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com || { echo "Key import failed"; exit 1; }
    sudo pacman-key --lsign-key 3056513887B78AEB
    sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

    echo -e "\n${Green}If you encountered any error, please stop and refer to the official guide:${NC}"
    echo "https://aur.chaotic.cx/"
    echo ""

    while true; do
        read -rp "Do you want to continue? (yes or no): " yn
        case $yn in
            [Yy]* ) echo -e "\n${Green}Proceeding...${NC}\n"; sleep 2; break;;
            [Nn]* ) echo -e "\n${Green}Exiting...${NC}"; exit;;
            * ) echo -e "${Green}Please answer yes or no. Press y for yes or n for no.${NC}";;
        esac
    done

    config_file_append
}

pacman_conf_chaotic_commented_not() {
    if grep -q '#

\[chaotic-aur\]

' /etc/pacman.conf || grep -q '#Include = /etc/pacman.d/chaotic-mirrorlist' /etc/pacman.conf; then
        echo -e "${Green}Chaotic AUR is installed but disabled.${NC}"
        echo -e "${Green}Enabling it...${NC}"

        echo -e "${Green}This process requires superuser permission. Please review the script before proceeding.${NC}"

        sudo sed -i 's/#

\[chaotic-aur\]

/

\[chaotic-aur\]

/' /etc/pacman.conf
        sudo sed -i 's/#Include = \/etc\/pacman.d\/chaotic-mirrorlist/Include = \/etc\/pacman.d\/chaotic-mirrorlist/' /etc/pacman.conf

        check_mirror_exists
    else
        echo -e "${Green}Chaotic AUR is not installed.${NC}"
        echo -e "${Green}Installing now...${NC}"
        install_chaotic_aur
    fi
}

pacman_conf_chaotic_check() {
    if grep -q '^

\[chaotic-aur\]

' /etc/pacman.conf && grep -q '^Include = /etc/pacman.d/chaotic-mirrorlist' /etc/pacman.conf; then
        echo -e "${Green}Chaotic AUR is already installed and enabled.${NC}"
    else
        pacman_conf_chaotic_commented_not
    fi
}

# Main Execution
tmpdir=$(mktemp -d)
cd "$tmpdir"
pacman_conf_chaotic_check
cd -
rm -rf "$tmpdir"
exit

