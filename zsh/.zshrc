# zmodload zsh/zprof

set -o noclobber
alias cp='cp -i'
alias mv='mv -i'

# unset run-help alias to man, and enable run-help
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

# open new tabs in the same directory
[[ -e /etc/profile.d/vte.sh ]] && source /etc/profile.d/vte.sh

# oh-my-zsh
export DEFAULT_USER="enam"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=15
DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(httpie poetry rust) # ripgrep
source $ZSH/oh-my-zsh.sh
# /oh-my-zsh

# starship prompt setup
eval "$(starship init zsh)"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export VISUAL="$EDITOR"

export PYENV_ROOT="$HOME/.pyenv"
export WASMTIME_HOME="$HOME/.wasmtime"

[[ -e $HOME/.alias ]] && source $HOME/.alias
export LESS="-R --mouse --wheel-lines 3"
path=(
    $HOME/.local/bin
    $PYENV_ROOT/bin
    $HOME/.cargo/bin
    $HOME/go/bin
    $WASMTIME_HOME/bin
    $path
    $HOME/.nsccli/bin
    $HOME/.local/share/JetBrains/Toolbox/scripts
)
export PATH

# enable pipx auto-completion
# autoload -U bashcompinit
# bashcompinit
# eval "$(register-python-argcomplete pipx)"

eval "$(pyenv init -)"

function reveal-md() {
    docker run --rm -p 1948:1948 -p 35729:35729 -v $PWD:/slides webpronl/reveal-md:latest /slides --watch
}

# THIS SHOULD BE THE LAST LINE !!
source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# zprof
