#!/bin/bash

# Define the path to pacman.conf
PACMAN_CONF="/etc/pacman.conf"
BACKUP_CONF="/etc/pacman.conf.bak"

# Check if the file exists
if [[ ! -f "$PACMAN_CONF" ]]; then
    echo "Error: $PACMAN_CONF does not exist."
    exit 1
fi

# Get the current timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create a timestamped backup of the mirrorlist file
BACKUP_CONF="${PACMAN_CONF}.bak_$TIMESTAMP"

# Create a backup of the original file
sudo cp "$PACMAN_CONF" "$BACKUP_CONF"
if [[ $? -ne 0 ]]; then
    echo "Error: Failed to create a backup of $PACMAN_CONF."
    exit 1
fi

echo "Backup created at $BACKUP_CONF."

# Use sed to comment out the specified lines
sudo sed -i '/^\[cachyos\]/,/^Include = \/etc\/pacman\.d\/cachyos-mirrorlist$/ s/^/#/' "$PACMAN_CONF"

if [[ $? -eq 0 ]]; then
    echo "Successfully commented out the cachyos repository lines in $PACMAN_CONF."
else
    echo "Error: Failed to modify $PACMAN_CONF."
    exit 1
fi

# Define the mirrorlist file path
MIRRORLIST_FILE="/etc/pacman.d/mirrorlist"

# Define the new server to add
NEW_SERVER="Server=https://archive.archlinux.org/repos/2024/12/21/\$repo/os/\$arch"

# Get the current timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Check if the script is run as root
#if [ "$EUID" -ne 0 ]; then
#  echo "Please run this script as root."
#  exit 1
#fi

# Create a timestamped backup of the mirrorlist file
BACKUP_FILE="${MIRRORLIST_FILE}.bak_$TIMESTAMP"
sudo cp "$MIRRORLIST_FILE" "$BACKUP_FILE"
echo "Backup created: $BACKUP_FILE"

# Comment out all existing Server lines in the original mirrorlist file
sudo sed -i 's/^\(Server\s*=\)/#\1/' "$MIRRORLIST_FILE"

# Add the new server line at the end of the file
sudo echo -e "\n$NEW_SERVER" >> "$MIRRORLIST_FILE"

echo "Mirrorlist updated successfully."
echo "New server added: $NEW_SERVER"

# Refresh the package database
#echo "Updating package database..."
#pacman -Syy

echo "Done."

echo "set timzone to Europe/Madrid"
timedatectl set-timezone Europe/Madrid

sudo pacman -Syy

echo "Session type: $XDG_SESSION_TYPE"


echo "install packages"
#sudo pacman -S qt5-tools

git config --global user.email krls.pjds@gmail.com
git config --global user.name krlspj

git config --global core.editor "vim"
git config --global credential.helper 'cache --timeout=15768000' # 6 month

sudo pacman --noconfirm -S neovim mpv

echo "neovim setup"
cd ~/.config
git clone https://github.com/krlspj/nvim-config.git nvim




