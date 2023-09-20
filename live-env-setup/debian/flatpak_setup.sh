#!/bin/bash

sudo apt update
sudo apt -y install flatpak

echo "add flathub repository"

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#bash neovim_flatpak_install.sh

#echo "install neovim"
#
#flatpak -y install io.neovim.nvim
#
#echo "alias nvim=\"flatpak run io.neovim.nvim\"" >> ~/.bash_aliases



