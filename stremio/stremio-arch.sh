#!/bin/bash
printf "============================\n"
printf "= Starting Stremio Install =\n"
printf "= By krls                  =\n"
printf "============================\n\n"

printf "installing flatpak \n"
sudo pacman -Syy
#yes | sudo pacman -S flatpak
sudo pacman --noconfirm -S flatpak

printf "Installing stremio...\n\n"
flatpak install -y com.stremio.Stremio
printf "==>Launch stremio from flatpak\n\n"
sleep 1;
flatpak run com.stremio.Stremio
