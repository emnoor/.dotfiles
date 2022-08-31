# zmodload zsh/zprof

set noclobber

# unset run-help alias to man, and enable run-help
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

# open new tabs in the same directory
if [ -e /etc/profile.d/vte.sh ]; then
    source /etc/profile.d/vte.sh
fi

# oh-my-zsh
export DEFAULT_USER="enam"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=15
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

# source local alias file
if [ -e $HOME/.alias ]; then
    source $HOME/.alias
fi

export LESS="-R --mouse --wheel-lines 3"

path=(
    $HOME/.local/bin
    $HOME/.cargo/bin
    $HOME/go/bin
    $path
    $HOME/.nsccli/bin
    $HOME/.local/share/JetBrains/Toolbox/scripts
)
export PATH

# load plugins
ZSH_SYNTAX_ARCH=/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_SYNTAX_UBUNTU=/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [ -e $ZSH_SYNTAX_ARCH ]; then
    source $ZSH_SYNTAX_ARCH
fi
if [ -e $ZSH_SYNTAX_UBUNTU ]; then
    source $ZSH_SYNTAX_UBUNTU
fi

# enable pipx auto-completion
# autoload -U bashcompinit
# bashcompinit
# eval "$(register-python-argcomplete pipx)"

# zprof
