#!/bin/bash

# --- INFO ---
# to allow pip install packages system wide use this flag: -break-system-packages
# pip install --user requests --break-system-packages
echo "Configure and install all packages needed for development"

./set_mirrolist_to_fix_date.sh

echo "Install codding packages"

sudo pacman --noconfirm -Syy \
	neovim xsel npm rustup tmux \
	python-pip \
	valgrind lldb podman #podman-compose

rustup install stable

sudo pacman --noconfirm -U https://archive.archlinux.org/packages/g/go/go-2%3A1.21.0-1-x86_64.pkg.tar.zst

sudo pacman --noconfirm -Scc

echo "Git config"
git config --global user.name krlspj
git config --global user.email krls.pjds@gmail.com
git config --global core.editor "nvim"

git clone https://github.com/krlspj/nvim-config.git $HOME/.config/nvim

sudo pacman --noconfirm -S redshift

# Check if .bashrc exists
if [ -f ~/.bashrc ]; then
  # Append the alias to .bashrc
  echo "" >> ~/.bashrc
  echo "# aliases" >> ~/.bashrc
  echo "alias lday='redshift -m randr -x'" >> ~/.bashrc
  echo "alias lnight='redshift -m randr -O 3000'" >> ~/.bashrc
  echo "Alias 'lday and lnight' has been added to ~/.bashrc."
  # Source .bashrc to apply changes immediately
  #source ~/.bashrc
else
  echo "Error: ~/.bashrc file not found. Please create it or check your installation."
fi
# set screen color temperature
redshift -m randr -O 3000
#redshift -m randr -x  # to reset the screen color

echo "Install java latest"
sudo pacman -S --noconfirm jdk-openjdk

echo "Install Anydesk"
sudo yay -Syy --noconfirm anydesk-bin

echo "install docker"

sudo pacman --noconfirm -S docker #$docker-compose
systemctl start docker.service

echo "setup docker for user $USER"
sudo groupadd docker
sudo usermod -aG docker $USER

echo "=================="
echo "RUN: newgrp docker"
echo "=================="
echo "INFO: https://docs.docker.com/engine/install/linux-postinstall/"

echo "getting stremio.. just in case.. :p"

sudo pacman --noconfirm -S flatpak

flatpak install -y com.stremio.Stremio

sleep 1;
flatpak run com.stremio.Stremio

