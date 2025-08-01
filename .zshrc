# Path to your oh-my-zsh configuration.
#ZSH=$HOME/.oh-my-zsh

ZSH=/usr/share/oh-my-zsh


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tors"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias oppdater="bash /home/tor/Scripts/Admin_scripts/oppdater"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump git vi-mode zsh-autosuggestions)

#Setter $ til Shift4
#[[ -f /home/tor/.Xmodmap ]] && xmodmap /home/tor/.Xmodmap

source $ZSH/oh-my-zsh.sh

if [ -f ~/.aliases ]
	then
		source ~/.aliases
	else
		echo "Ingen alias lasta fra fil"
fi
# Customize to your needs...
export TERM='xterm-256color'
bindkey -v
export EDITOR="vim"
export BROWSER="vivaldi-stable"
export BUKU_COLORS="jIegf"
export RANGER_LOAD_DEFAULT_RC=FALSE
export PATH=/home/tor/bin:$PATH
export PATH=/usr/include/qt/QtGui:$PATH
# For å unngå unødvendige feilmeldinger i terminal 
export NO_AT_BRIDGE=1
systemctl --user import-environment PATH
source /usr/share/oh-my-zsh/plugins/command-not-found/command-not-found.plugin.zsh
#source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh
autoload -U zutil
autoload -U compinit
autoload -U complist
autoload -U zmv
compinit
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
setopt correctall
#echo -e ; archey 

# Created by `pipx` on 2024-09-11 20:47:08
export PATH="$PATH:/home/tor/.local/bin"
source /usr/lib/spaceship-prompt/spaceship.zsh
