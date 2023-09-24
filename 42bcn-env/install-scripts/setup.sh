#!/bin/bash

echo ">> update system"
apt-get update && apt-get -y upgrade

echo ">> install packages"
apt-get -y install git xsel python3-pip python3-venv 
apt-get -y install gcc clang libpq-dev libbsd-dev libncurses-dev valgrind

cd /root
python3 -m venv ./venv

echo ">> to activate python virtual environment: source $HOME/venv/bin/activate"
echo ">> to deactivate: deactivate"

source $HOME/venv/bin/activate
pip3 install --upgrade pip setuptools
pip3 install norminette

#pip3 install --user c-formatter-42
pip3 install c-formatter-42
echo "use c-formatter-42:"
echo "c_formatter_42 <filename.c>"

echo ">> end update and packages installation"

echo ">> installing francinette"
cd
git clone --recursive https://github.com/xicodomingues/francinette.git francinette
pip3 install -r francinette/requirements.txt

echo ">> add aliases to .bashrc"
echo "alias pingu-es-vida=\"source $HOME/venv/bin/activate\"" >> $HOME/.bashrc
echo "alias mcheck=$HOME/francinette/tester.sh" >> $HOME/.bashrc
echo "alias mc=$HOME/francinette/tester.sh" >> $HOME/.bashrc

echo "=== INSTRUCTIONS ==="
echo ">> pingu-es-vida to activate the virtual environment"
echo ">> mcheck or mc to launch francinette"
echo ">> deactivate to close virtual environment"

echo "=== Container Management ==="
echo "# to run an interactive shell inside docker:"
echo ">> docker exec -it 42bcn-env /bin/bash"
echo ">> docker stop 42bcn-env		// to stop the container"
echo ">> docker restart 42bcn-env	// to start container again"
echo ">> docker compose down	// to remove container and network"
