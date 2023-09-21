#!/bin/bash

#which firefox >/dev/null 2>&1
#is_installed=$?
#echo "outpu is $is_installed"
##if [[ $? -eq 0 ]]; then
#if [[ $is_installed -eq 0 ]]; then
#    echo "Firefox is installed."
#else
#    echo "Firefox is not installed."
#fi
#exit 0

./git_config.sh

if which firefox >/dev/null 2>&1; then
	echo "Firefox is installed"
	./firefox_addons_config.sh
else
	echo "firefox is not installed"
fi

#./install_edge.sh

./neovim_appimage.sh

#bash snap_setup.sh
#bash neovim_snap_install.sh

./neovim_configure.sh

#./docker_engine_install.sh

./redshift_install.sh

echo "end init config"
