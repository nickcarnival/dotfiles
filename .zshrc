# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
export TERM="xterm-256color"

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="random"
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time os_icon)
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-remotebranch git-aheadbehind)
POWERLEVEL9K_SHORTEN_DELIMETER="***"
POWERLEVEL9K_VCS_SHORTEN_LENGHT=4
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGHT=11
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_middle"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# aliases
alias r="ranger"
alias vim="nvim"
alias v="nvim"
alias svim="sudo vim"
alias p="python"
alias xinitrc="nvim ~/.xinitrc"
alias vm="virtualbox"
alias m="man"
alias temp="watch sensors -f"
alias tp="ping -c 1 1.1.1.1"
alias sl='ls'
alias trash='rm ./trash*'
alias urxvt='rxvt-unicode'

function findport () {
    sudo lsof -i -P | grep LISTEN | grep :$1
}

function sudokill () {
    sudo kill -9 $1
}

function gitssh () {
    eval `ssh-agent`
    ssh-add ~/.ssh/$1
}

# Application Config Aliases
alias dotfiles="cd ~/dotfiles"
alias i3config="vim ~/dotfiles/.config/i3/config"
alias zshrc="vim ~/dotfiles/.zshrc && zsh"
alias polybarrc="vim ~/dotfiles/.config/polybar/config"
alias alacrittyrc="vim ~/dotfiles/.config/alacritty/alacritty.yml"
alias tmuxrc="vim ~/dotfiles/.tmux.conf"

function vimrc () {
    nvim ~/.vim/vimrc
    # Set the vim syslinks
    nvim +PlugInstall +qall
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
