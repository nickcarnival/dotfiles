# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.


# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
export TERM="xterm-256color"

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="random"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="xiong-chiamiov"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time os_icon)
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-remotebranch git-aheadbehind)
POWERLEVEL9K_SHORTEN_DELIMETER="***"
POWERLEVEL9K_VCS_SHORTEN_LENGHT=4
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGHT=11
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_middle"
plugins=(
	git
	# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# aliases
alias r="ranger"
alias vim="nvim"
alias v="nvim"
alias svim="sudo vim"
alias p="python"
alias p="python3"
alias xinitrc="nvim ~/.xinitrc"
alias vm="virtualbox"
alias m="man"
alias temp="watch sensors -f"
alias tp="ping -c 5 1.1.1.1"
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
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform


alias dock='docker compose down && docker compose up -d'
alias dockdown='docker compose down'
alias dockup='docker compose up -d'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/ncarnival/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
