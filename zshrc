# alias
alias k="kubectl"
alias kc="kubectx"
alias weather="curl wttr.in"

# zsh
export ZSH=~/.oh-my-zsh
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath=($fpath "$HOME/.zfunctions")
plugins=(git pip poetry golang kubectl zsh-autosuggestions zsh-syntax-highlighting fzf-tab)
DISABLE_MAGIC_FUNCTIONS=true # disable magic functions for oh-my-zsh otherwise it will cause url encode issue
source $ZSH/oh-my-zsh.sh


# dev env
eval "$(~/.local/bin/mise activate zsh)"
export KUBECONFIG="$HOME/.kube/config"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# homebrew related ssl issue for extra build tools
# see more in https://mise.jdx.dev/lang/python.html#troubleshooting-errors-with-homebrew
export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"

# golang
export PATH="$PATH:$(go env GOPATH)/bin"
# source $HOME/.gvm/scripts/gvm

# python
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"


# shell prompt
eval "$(starship init zsh)"
