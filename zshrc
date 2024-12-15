# 环境变量
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
export KUBECONFIG="$HOME/.kube/config"

# SSL 相关
export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"

# oh-my-zsh 配置
export ZSH=~/.oh-my-zsh
plugins=(git golang kubectl zsh-autosuggestions zsh-syntax-highlighting fzf-tab)
DISABLE_MAGIC_FUNCTIONS=true
source $ZSH/oh-my-zsh.sh

# 开发工具初始化
eval "$(~/.local/bin/mise activate zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# 别名
alias k="kubectl"
alias kc="kubectx"
alias weather="curl wttr.in"

# shell prompt
eval "$(starship init zsh)"