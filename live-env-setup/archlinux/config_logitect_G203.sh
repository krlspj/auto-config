#!/bin/bash

# ensure installed flatpak & flathub

sudo pacman -S --noconfirm ratbagd libratbag

flatpak install -y flathub org.freedesktop.Piper

systemctl status ratbagd.service




