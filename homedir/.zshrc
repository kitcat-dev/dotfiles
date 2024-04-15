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
alias p="pnpm"
alias md="glow"
alias rimraf="rm -rf"

alias docker-clear="docker rmi \$(docker images -f \"dangling=true\" -q)"

# NODE
eval "$(fnm env --use-on-cd)"

autoload -U +X bashcompinit && bashcompinit
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# TOKENS

# export SMTH=...

# CUSTOM
