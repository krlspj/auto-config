#!/bin/bash

# --- INFO ---
# to allow pip install packages system wide use this flag: -break-system-packages
# pip install --user requests --break-system-packages
echo "Configure and install all packages needed for development"

./set_mirrolist_to_fix_date.sh

echo "Install codding packages"

sudo pacman --noconfirm -Syy neovim tmux valgrind npm lldb

sudo pacman --noconfirm -U https://archive.archlinux.org/packages/g/go/go-2%3A1.21.0-1-x86_64.pkg.tar.zst

sudo pacman --noconfirm -Scc


git clone https://github.com/krlspj/nvim-config.git $HOME/.config/nvim


