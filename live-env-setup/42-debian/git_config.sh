#!/bin/bash

echo "start init config..."

echo "git config start"
if git config --get user.email>/dev/null; then
    echo "Git user.email is set."
else
    echo "Git user.email is not set. Adding one."
	git config --global user.email "krls.pjds@gmail.com"
fi
if git config --get user.name >/dev/null; then
    echo "Git user.name is set."
else
    echo "Git user.name is not set. Adding one."
	git config --global user.name "krlspj"
fi

#git config --global credential.helper 'cache --timeout=3600'
git config --global credential.helper 'cache --timeout=5184000'

echo "git config end"

