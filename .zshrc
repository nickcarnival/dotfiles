#
# User configuration sourced by interactive shells
#

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
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# aliases
alias r="ranger"
alias vim="nvim"
alias v="nvim"
alias svim="sudo vim"
alias p="python"
#alias ls="lsd"
alias xinitrc="nvim ~/.xinitrc"
alias vm="virtualbox"
alias m="man"
alias temp="watch sensors -f"
alias tp="ping -c 1 1.1.1.1"
alias sl='ls'
alias trash='rm ./trash*'

function mkcd () {
    mkdir $1
    cd $1
}

function wifi () {
    sudo wifi-menu
}

function cs () {
    cd $1
    ls
}

function copy() {
    xclip -sel c $1
}

function clean() {
    echo '[*] Removing Pacman Cache'
    sudo paccache --remove --keep 1
    echo '[*] Removing Unused Pacman Packages'
    sudo pacman -Qtdq
}

function update () {
    echo '[*] Updating Arch'
    sudo pacman -Syu -y
    echo '[*] Updating ZSH'
    upgrade_oh_my_zsh
    echo '[*] Updating Yay repositories'
    sudo yay -Syu
    echo '[*] Updating pip'
    pip install --upgrade pip
}

function install() {
    echo "[*] Installing $1"
    sudo pacman -Syu $1
}

function gitssh () {
    eval `ssh-agent`
    ssh-add ~/.ssh/captain
}


# SSH Aliases
alias isengard="ssh ncarnival@isengard.mines.edu "
alias illuminate="ssh ncarnival@illuminate.mines.edu "
alias imagine="ssh ncarnival@imagine.mines.edu "

alias minesvpn="sudo openvpn --config client.ovpn"


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
