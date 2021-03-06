export ZSH=~/.oh-my-zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH=$PATH:/usr/local/Cellar/perl/5.32.1_1/bin
export PATH=/Users/ehco/.tiup/bin:$PATH

export ANSIBLE_CONFIG=/Users/ehco/gwork/ansible/ansible.cfg

# start for DM test
export MYSQL_PORT=3306
export MYSQL_PSWD=123456
export MYSQL_HOST=127.0.0.1
export DM_MASTER_ADDR="127.0.0.1:8261"

# plugins
plugins=(git z pip golang kubectl zsh-autosuggestions zsh-syntax-highlighting fzf-tab)

source $ZSH/oh-my-zsh.sh
source /Users/ehco/.gvm/scripts/gvm

alias cow='fortune | cowsay | lolcat'
alias d='docker'
alias dp='docker-compose'
alias t="tmux"
alias kc="kubectx"
# pyenv vitualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set Spaceship ZSH as a prompt
fpath=($fpath "/Users/ehco/.zfunctions")
autoload -U promptinit
promptinit
prompt spaceship
