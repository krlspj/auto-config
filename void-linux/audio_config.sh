#!/bin/bash

echo "installing pipewire and alsa"
sudo xbps-install -y pipewire alsa-pipewire alsamixer

echo "Setup pipewire config..."
sudo mkdir -p /etc/alsa/conf.d
#ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
#ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d

#exec pipewire