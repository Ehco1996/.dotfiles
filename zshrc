# zshrc for ehco
# cd ~

export ZSH=~/.oh-my-zsh
export LANG=en_US.UTF-8
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export GO111MODULE=on
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ANSIBLE_CONFIG=/Users/ehco/gwork/ansible/ansible.cfg

# plugins
plugins=( git z pip golang kubectl zsh-autosuggestions zsh-syntax-highlighting fzf-tab)

source $ZSH/oh-my-zsh.sh
source /Users/ehco/.gvm/scripts/gvm

alias cow='fortune | cowsay | lolcat'
alias d='docker'
alias dp='docker-compose'
alias t="tmux"
alias kc="kubectx"
alias wopen="explorer.exe"

# pyenv vitualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

autoload -U promptinit; promptinit
prompt spaceship


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
