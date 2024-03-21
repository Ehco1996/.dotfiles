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
source $ZSH/oh-my-zsh.sh


# pingcap
# export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
# export MYSQL_PORT=3306
# export MYSQL_PSWD=123456
# export MYSQL_HOST=127.0.0.1
# export DM_MASTER_ADDR="127.0.0.1:8261"
# export PATH="$HOME/.tiup/bin:$PATH"
# alias sed="gsed"
# alias ln="gln"

# dev
export KUBECONFIG="$HOME/.kube/config"
export MBD_DB_PASSWORD="123456"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"


# golang
export PATH="$PATH:$(go env GOPATH)/bin"
# source $HOME/.gvm/scripts/gvm

# python
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# prompt
eval "$(starship init zsh)"

