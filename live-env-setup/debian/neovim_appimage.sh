#!/bin/bash
mkdir -p ~/bin
wget -O ~/bin/nvim.appimage https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage
chmod +x ~/bin/nvim.appimage

#echo "# Neovim alias" >> ~/.zshrc
#echo "alias nvim=\"$HOME/bin/nvim.appimage\"" >> ~/.zshrc

./scripts/save_to_fileRC.sh "# Neovim alias"
./scripts/save_to_fileRC.sh "alias nvim=\"$HOME/bin/nvim.appimage\""
