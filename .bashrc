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

alias zapret-config='$HOME/zapret-configs/install.sh'
alias zapret-utils='$HOME/zapret-configs/utils-zapret.sh'
alias zapret-utils='$HOME/zapret-configs/utils-zapret.sh'
alias zapret-utils='$HOME/zapret-configs/utils-zapret.sh'

alias ls='eza -l --icons --git'
alias la='eza -la --icons --git'

alias tas='tmux attach-session -t'

# opencode
export PATH=/home/vlad/.opencode/bin:$PATH
export PATH="$PATH:$HOME/jdtls/bin"
export JDTLS_HOME="$HOME/jdtls"

# Java JDK
export JAVA_HOME=$HOME/jdk/jdk-17.0.17+10
export PATH=$JAVA_HOME/bin:$PATH
