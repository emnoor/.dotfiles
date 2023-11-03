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
plugins=()
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

# enable pipx auto-completion
# autoload -U bashcompinit
# bashcompinit
# eval "$(register-python-argcomplete pipx)"

# THIS SHOULD BE THE LAST LINE !!
# Don't enable z-sy-h on wsl, as it is VERY slow
if ! [[ -v WSL_DISTRO_NAME ]]; then
  source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi

# zprof
