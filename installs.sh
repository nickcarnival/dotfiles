#!/bin/bash
# Installs all of these
installs=("curl" "dmenu" "polybar" "neovim" "i3-wm")

for prog in "${installs[@]}"
do
    sudo apt-get install "$prog" 
done

