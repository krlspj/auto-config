#!/bin/bash

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
