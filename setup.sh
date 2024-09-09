#!/bin/bash

#Setup script for Dotfiles
echo -e "\u001b[32;1m Setting up Dotfiles...\u001b[0m"

echo -e "  \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
echo -e "  \u001b[34;1m (1) Install oh-my-zsh \u001b[0m"
echo -e "  \u001b[34;1m (2) Install zsh plugins \u001b[0m"
echo -e "  \u001b[34;1m (3) Install vim plugins \u001b[0m"
echo -e "  \u001b[34;1m (4) Setup symlinks \u001b[0m"
echo -e "  \u001b[34;1m (5) Setup vim symlinks \u001b[0m"
echo -e "  \u001b[34;1m (6) Setup ranger symlinks \u001b[0m"
echo -e "  \u001b[31;1m (0) Exit \u001b[0m"

echo -en "\u001b[32;1m ==> \u001b[0m"

read -r option

case $option in

"1")echo -e "\u001b[7m Installing oh-my-zsh...\u001b[0m"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ;;

"2")echo -e "\u001b[7m Installing zsh plugins...\u001b[0m"
    # Get the oh-my-zsh plugin
    git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    ;;

"3")echo -e "\u001b[7m Installing vim plugins... \u001b[0m"
    if [ -d "~/.vim/bundle/" ]; then
        echo 'Vundle is not installed, installing it'
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    # This might be causing errors
    if [ -d "~/.vim/.vim" ]; then
        rm -rf ~/.vim/.vim
    fi

    echo 'Copying Local Vim config to home directory'
    cp -r "$PWD/.vim" ~/.vim 

    # Handle command not found
    if [ -x "$(command -v nvim)" ]
    then
        # Is installed
        nvim +PlugInstall +qall
    else
        # Is not installed

        echo -e "\u001b[33mNeovim \u001b[0mis not installed, would you like to install it? \u001b[33m(y/n) \u001b[0m"
        echo -en "\u001b[32;1m ==> \u001b[0m"
        read -r install_nvim

        if [ $install_nvim = "y" ]
        then
            YUM_CMD=$(which yum) 
            APT_GET_CMD=$(which apt-get) 
            PACMAN_CMD=$(which pacman) 
            if [[  ! -z $YUM_CMD ]]; then
                yum install -y https:dl.fedoraproject.org/pub/epel/epel-release-latest-7-noarch.rpm
                yum install -y neovim python3-neovim
            elif [[ ! -z $APT_GET_CMD ]]; then
                sudo apt-get install neovim -y
            elif [[ ! -z $PACMAN_CMD ]]; then
                sudo pacman -S --noconfirm nvim
            fi
        else
            echo -e "\u001b[33m Vim plugins will not be installed. \u001b[m"
        fi
    fi
    ;;

"4")echo -e "\u001b[7m Setting up symlinks... \u001b[0m"
    echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
    mv -iv ~/.config/alacritty ~/.config/alacritty.old
    mv -iv ~/.config/compton ~/.config/compton.old
    mv -iv ~/.config/i3 ~/.config/i3.old
    mv -iv ~/.config/polybar ~/.config/polybar.old
    mv -iv ~/.config/ranger ~/.config/ranger.old
    mv -iv ~/.config/nvim ~/.config/nvim.old

    mv -iv ~/.gitconfig ~/.gitconfig.old
    mv -iv ~/.tmux.conf ~/.tmux.conf.old
    mv -iv ~/.vim/ ~/.vim.old
    mv -iv ~/.zshrc ~/.zshrc.old
    mv -iv ~/.bashrc ~/.bashrc.old
    mv -iv ~/.xinitrc ~/.xinitrc.old

    echo -e "\u001b[36;1m Adding symlinks...\u001b[0m"
    ln -sfnv "$PWD/.config/i3" ~/.config/i3
    ln -sfnv "$PWD/.config/polybar" ~/.config/polybar
    ln -sfnv "$PWD/.config/alacritty" ~/.config/alacritty
    ln -sfnv "$PWD/.config/nvim" ~/.config/nvim
    ln -sfnv "$PWD/.config/ranger/" ~/.config/ranger
    ln -sfnv "$PWD/.config/compton/" ~/.config/compton

    ln -sfnv "$PWD/.gitconfig" ~/.gitconfig
    ln -sfnv "$PWD/.tmux.conf" ~/.tmux.conf
    ln -sfnv "$PWD/.vim" ~/.vim
    ln -sfnv "$PWD/.zshrc" ~/.zshrc
    ln -sfnv "$PWD/.bashrc" ~/.bashrc
    ln -sfnv "$PWD/.xinitrc" ~/.xinitrc

    echo -e "\u001b[36;1m Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old'. \u001b[0m"
    ;;
"5")echo -e "\u001b[7m Setting Up vim symlinks... \u001b[0m"
    mv -iv ~/.vim/ ~/.vim.old
    ln -sfnv "$PWD/.config/nvim" ~/.config/nvim
    ln -sfnv "$PWD/.vim" ~/.vim
    ;;

"6")echo -e "\u001b[7m Installing ranger...\u001b[0m"
    mv -iv ~/.ranger/ ~/.ranger.old
    ln -sfnv "$PWD/.config/ranger" ~/.config/ranger
    ;;


"0")echo -e "\u001b[32;1m Bye! \u001b[0m"
    exit 0
    ;;

*)echo -e "\u001b[31;1m Invalid option entered! \u001b[0m"
    exit 1
    ;;
esac

exit 0
