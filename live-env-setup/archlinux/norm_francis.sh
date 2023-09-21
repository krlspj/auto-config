#!/bin/bash
sudo pacman -S --noconfirm python-pip python-venv
sudo pacman -S --noconfirm gcc clang libsbsd ncurses valgrind postgresql


cd $HOME

python -m venv ./venv
echo ">> to activate python virtual environment: source $HOME/venv/bin/activate"
echo ">> to deactivate: deactivate"

source $HOME/venv/bin/activate
pip install --upgrade pip setuptools
pip install norminette

git clone --recursive https://github.com/xicodomingues/francinette.git francinette

pip3 install -r francinette/requirements.txt

echo ">> add aliases to .bashrc"
echo "alias pingu-is-life=\"source $HOME/venv/bin/activate\"" >> $HOME/.bashrc
echo "alias mcheck=$HOME/francinette/tester.sh" >> $HOME/.bashrc
echo "alias mc=$HOME/francinette/tester.sh" >> $HOME/.bashrc

echo "=== INSTRUCTIONS ==="
echo ""
echo ">> pingu-is-life to activate the virtual environment"
echo ">> mcheck or mc to launch francinette"
echo ">> deactivate to close virtual environment"
