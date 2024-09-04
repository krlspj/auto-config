#!/bin/bash

sudo apt-get update
sudo apt-get install -y neovim

# VPN
# install packages for openvpn
sudo apt-get -y install openvpn network-manager-openvpn network-manager-l2tp

# Recording
sudo apt-get -y install cheese simplescreenrecorder

bash chrome-repo.sh
