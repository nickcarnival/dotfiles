#!/bin/bash
# Installs all of these
installs=("curl" "dmenu" "polybar" "neovim" "i3-wm" "ranger" "nvim")
command_to_run="brew"

if command -v brew &> /dev/null; then
	echo "Using brew to install dependencies";
else
	if command -v apt-get &> /dev/null; then
		echo "Using apt-get to install dependencies";
	else
		if command -v pacman &> /dev/null; then
			echo "Using pacman to install dependencies";
		fi
	fi
fi

for prog in "${installs[@]}"
do
    sudo apt-get install "$prog" 
    brew install "$prog" 
    pacman -Syu "$prog" 
done

