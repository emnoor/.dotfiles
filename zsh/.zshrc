# zmodload zsh/zprof

set -o noclobber
alias cp='cp -i'
alias mv='mv -i'

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# unset run-help alias to man, and enable run-help
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

# open new tabs in the same directory
[[ -e /etc/profile.d/vte.sh ]] && source /etc/profile.d/vte.sh

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode disabled
CASE_SENSITIVE=true
DISABLE_MAGIC_FUNCTIONS=true
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
source $ZSH/oh-my-zsh.sh
# /oh-my-zsh

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
)
export PATH

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(uv generate-shell-completion zsh)"

export HOMEBREW_BUNDLE_FILE="$HOME/.dotfiles/Brewfile"

files_to_source=(
  "$HOME/.zshrc.user" 
  "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh   # fzf mac
  /usr/share/doc/fzf/examples/key-bindings.zsh      # fzf ubuntu
  /usr/share/doc/fzf/examples/completion.zsh        # fzf ubuntu
)

for file_to_source in $files_to_source; do
  if [ -f "$file_to_source" ]; then
    source "$file_to_source"
  fi
done

bindkey -s ^f "tmux-sessionizer\n"

# zprof
