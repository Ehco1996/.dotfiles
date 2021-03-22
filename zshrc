export ZSH=~/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin
export ANSIBLE_CONFIG=/Users/ehco/gwork/ansible/ansible.cfg

# plugins
plugins=( git z pip golang kubectl zsh-autosuggestions zsh-syntax-highlighting fzf-tab)
ZSH_THEME="spaceship"

source $ZSH/oh-my-zsh.sh
# source /Users/ehco/.gvm/scripts/gvm

alias cow='fortune | cowsay | lolcat'
alias d='docker'
alias dp='docker-compose'
alias t="tmux"
alias kc="kubectx"

# pyenv vitualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
