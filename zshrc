# zshrc for ehco
cd ~
export ZSH=~/.oh-my-zsh
export LANG=en_US.UTF-8
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export GO111MODULE=on
#export PATH=$PATH:$(go env GOPATH)/bin
export ANSIBLE_CONFIG=/Users/ehco/gwork/ansible/ansible.cfg

# plugins
plugins=( git z pip golang kubectl zsh-autosuggestions zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

alias cow='fortune | cowsay | lolcat'
alias d='docker'
alias dp='docker-compose'
alias t="tmux"
alias kc="kubectx"

# pyenv vitualenv
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"


eval "$(starship init zsh)"
