set noclobber

# unset run-help alias to man, and enable run-help
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

# open new tabs in the same directory
source /etc/profile.d/vte.sh

# oh-my-zsh
export DEFAULT_USER="enam"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
# DISABLE_AUTO_UPDATE="true"
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

source ~/.alias
export LESS="-R --mouse --wheel-lines 3"
export PATH=~/go/bin:$PATH

# simple timers
function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

function stopwatch(){
  date1=`date +%s`; 
   while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
   done
}

# load plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enable pipx auto-completion
# autoload -U bashcompinit
# bashcompinit
eval "$(register-python-argcomplete pipx)"
export PATH="$PATH:$HOME/.nsccli/bin"
