#!/bin/bash
printf "============================\n"
printf "= Starting Stremio Install =\n"
printf "============================\n\n"

#cd ~/Downloads
#printf "Downloading Stremio --> Flatpak\n\n"
#wget https://dl.flathub.org/repo/appstream/com.stremio.Stremio.flatpakref

printf "==> Installing flatpak \n"
sudo apt update
sudo apt -y install flatpak

printf "==> Add flathub repository\n\n"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

printf "==> Installing stremio...\n\n"
flatpak install -y com.stremio.Stremio.flatpakref
printf "==> Launch stremio from flatpak\n\n"
sleep 1;
flatpak run com.stremio.Stremio
