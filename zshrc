# zshrc for ehco

export ZSH=~/.oh-my-zsh
export LANG=en_US.UTF-8
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export GO111MODULE=on


# plugins
plugins=( git z pip go kubectl zsh-autosuggestions zsh-syntax-highlighting )

ZSH_THEME="spaceship"

source $ZSH/oh-my-zsh.sh

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

alias cow='fortune | cowsay | lolcat'
alias d='docker'
alias dp='docker-compose'
alias t="tmux"

# for socks5
alias ss='export all_proxy=socks5://127.0.0.1:1090'
alias unss='unset all_proxy'

# Set Spaceship ZSH as a prompt
# autoload -U promptinit; promptinit
# prompt spaceship
SPACESHIP_NODE_SHOW="false"

# pyenv vitualenv
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"