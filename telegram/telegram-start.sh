#!/bin/bash

cd ~/Downloads
wget --output-document tsetup.tar.xz https://telegram.org/dl/desktop/linux 

tar -xvf tsetup.tar.xz

./Telegram/Telegram &
