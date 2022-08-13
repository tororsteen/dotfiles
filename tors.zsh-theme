function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

PROMPT='%(!.%{$fg_bold[red]%}.%{$fg[green]%}%n@)%m %(!.%1~.%~) $(git_prompt_info)%_%# %{$reset_color%} '

RPROMPT='%(?,%F{green}:%),%F{yellow}%? %F{red}:()%f'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
