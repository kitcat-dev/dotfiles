if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# node
eval "$(fnm env --use-on-cd)"

# editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

# aliases
alias g="git"
alias rimraf="rm -rf"

alias wget='wget -c'
alias sha='shasum -a 256'
alias guid='uuidgen'

alias dc="docker-compose"
alias docker-clear="docker rmi \$(docker images -f \"dangling=true\" -q)"
