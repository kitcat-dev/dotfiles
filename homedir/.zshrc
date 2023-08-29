if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# EDITOR
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

# ALIASES
alias g="git"
alias rimraf="rm -rf"

alias dc="docker-compose"
alias docker-clear="docker rmi \$(docker images -f \"dangling=true\" -q)"

# NODE
eval "$(fnm env --use-on-cd)"

# TOKENS

# export SMTH=...

# CUSTOM

autoload -U +X bashcompinit && bashcompinit
