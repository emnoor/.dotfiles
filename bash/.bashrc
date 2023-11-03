# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o noclobber
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
