#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Black=0;30     
#Blue=0;34     
#GREEN="0;32m"     
#Cyan=0;36     
#Red=0;31     
#Purple=0;35     
#Brown=0;33     
#Light Gray  0;37     
#Dark Gray     1;30
#Light Blue    1;34
#Light Green   1;32
#Light Cyan    1;36
#Light Red     1;31
#Light Purple  1;35
#Yellow        1;33
#White         1;37

source /usr/share/doc/pkgfile/command-not-found.bash

if [ -f ~/.aliases ]
	then
		source ~/.aliases
	else
		echo "Ingen alias lasta fra fil"
fi

set -o vi #bruker vim-taster

export EDITOR="vim"
export PATH=/home/tor/bin:$PATH
PS1='\e[0;32m\u@\h \w $ \e[00m'
