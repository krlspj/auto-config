#!/bin/bash

echo ">> update system"
sudo apt-get update #$&& sudo apt-get -y upgrade

echo ">> install packages"
sudo apt-get -y install git xsel python3-pip python3-venv 
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install gcc clang libpq-dev libbsd-dev libncurses-dev valgrind

cd $HOME
python3 -m venv ./venv

echo ">> to activate python virtual environment: source $HOME/venv/bin/activate"
echo ">> to deactivate: deactivate"

source $HOME/venv/bin/activate
pip3 install --upgrade pip setuptools
pip3 install norminette

echo ">> end update and packages installation"

echo ">> installing francinette"
cd
git clone --recursive https://github.com/xicodomingues/francinette.git francinette
pip3 install -r francinette/requirements.txt

#echo ">> install and configure neovim for 42"
#/install-scripts/neovim_appimage_42.sh

echo ">> add aliases to .bashrc"
echo "alias pingu-is-life=\"source $HOME/venv/bin/activate\"" >> $HOME/.zshrc
echo "alias mcheck=$HOME/francinette/tester.sh" >> $HOME/.zshrc
echo "alias mc=$HOME/francinette/tester.sh" >> $HOME/.zshrc
