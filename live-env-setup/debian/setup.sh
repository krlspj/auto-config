#!/bin/bash

# Use snapshot repository
SOURCES_FILE="/etc/apt/sources.list"
TIMESTAMP="20240901T000000Z"
EXECUTION_TIMESTAMP=$(date +"%Y%m%dT%H%M%SZ")
# Backup the original sources.list
sudo cp "$SOURCES_FILE" "${SOURCES_FILE}_$EXECUTION_TIMESTAMP.bak"
# Write the updated content to the file using 'tee' for proper permission handling
sudo tee "$SOURCES_FILE" > /dev/null <<EOF
deb http://snapshot.debian.org/archive/debian/$TIMESTAMP/ bookworm main non-free-firmware
deb [trusted=yes] file:/run/live/medium bookworm main non-free-firmware
EOF
# Notify the user of the changes
echo "Updated $SOURCES_FILE. A backup was saved as ${SOURCES_FILE}.bak."

sudo apt-get update
sudo apt-get install -y neovim

# VPN
# install packages for openvpn
sudo apt-get -y install openvpn network-manager-openvpn network-manager-l2tp

# Google Chrome
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null
echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update && sudo apt -y install google-chrome-stable
# call the script
#bash chrome-repo.sh

# Recording
sudo apt-get -y install cheese simplescreenrecorder
