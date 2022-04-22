#!/bin/bash

echo "update repo"
sudo xbps-install -Sy

echo "installing neovim"
sudo xbps-install -y neovim exa fzf xtools git
echo "git config"
git config --global user.email "krls.pjds@gmail.com"
git config --global user.name "krlspj"

echo "launch audio_config.sh"
bash ./audio_config.sh


