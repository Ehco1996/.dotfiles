# alias
alias k="kubectl"
alias kc="kubectx"
alias sed="gsed"
alias ln="gln"

# zsh
export ZSH=~/.oh-my-zsh
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath=($fpath "/Users/ehco/.zfunctions")
plugins=(git pip golang kubectl zsh-autosuggestions zsh-syntax-highlighting fzf-tab)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubicon:$PATH"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# pingcap
export MYSQL_PORT=3306
export MYSQL_PSWD=123456
export MYSQL_HOST=127.0.0.1
export DM_MASTER_ADDR="127.0.0.1:8261"
export PATH="$PATH:/Users/ehco/Documents/pingcap/tiflow/bin"
export PATH="/Users/ehco/.tiup/bin:$PATH"

# dev
export KUBECONFIG="/Users/ehco/.kube/config"
export MBD_DB_PASSWORD="123456"
export MYSQL_PASSWORD="123456"
export ANSIBLE_CONFIG=/Users/ehco/gwork/ansible/ansible.cfg

# golang
export PATH="$PATH:$(go env GOPATH)/bin"
source $HOME/.gvm/scripts/gvm
export GORACE=history_size=2

# python
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# prompt
# autoload -U promptinit
# promptinit
# prompt spaceship # not used now
eval "$(starship init zsh)"
