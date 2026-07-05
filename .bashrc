# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/src/scripts:$PATH"
export PATH="$HOME/build/void-packages:$PATH"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias lsa='ls -lah --color=auto'
alias f='ufetch'
alias cls='clear && f'
PS1='\[\e[35;1m\]\u\[\e[39m\]:\[\e[32m\]\h\[\e[0m\] \[\e[3m\]\w\[\e[0m\] \[\e[35m\]  \[\e[0m\]'
#PS1='[\u@\h \W]\$ '

# Load rust stuff
. "$HOME/.cargo/env"
