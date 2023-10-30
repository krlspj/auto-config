#!/bin/bash

sudo apt update
sudo apt -y install snapd

sudo systemctl start snapd.service

#bash neovim_snap_install.sh
