#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias xp="tmuxp"
alias x="tmux"
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
export PATH=$PATH:/usr/local/go/bin
