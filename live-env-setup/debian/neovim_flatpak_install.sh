#!/bin/bash

echo "install flatpak neovim"

flatpak -y install io.neovim.nvim

echo "alias nvim=\"flatpak run io.neovim.nvim\"" >> ~/.bash_aliases


