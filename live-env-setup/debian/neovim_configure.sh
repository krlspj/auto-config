#!/bin/bash
location=$(pwd)
cd ~/.config

git clone https://github.com/krlspj/nvim-config.git nvim

sudo apt update
sudo apt -y install xsel

# ensure installation of golang and npm if needed
sudo apt -y install npm
#sudo apt -y install golang
cd $location
./go_install.sh

