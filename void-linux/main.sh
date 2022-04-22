#!/bin/bash

echo "update repo"
sudo xbps-install -Sy

echo "installing neovim"
sudo xbps-install -y neovim exa fzf xtools git
echo "git config"
git config --global user.email "krls.pjds@gmail.com"
git config --global user.name "krlspj"

#echo "launch audio_config.sh"
#bash ./audio_config.sh
echo "installing pipewire and alsa"
sudo xbps-install -y pipewire alsa-pipewire AlsaMixer.app

echo "Setup pipewire config..."
sudo mkdir -p /etc/alsa/conf.d
#ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
#ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d

#exec pipewire

