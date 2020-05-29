# zshrc for ehco

export ZSH=~/.oh-my-zsh
export LANG=en_US.UTF-8
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export GO111MODULE=on


# plugins
plugins=( git z pip go kubectl zsh-autosuggestions zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

alias cow='fortune | cowsay | lolcat'
alias d='docker'
alias dp='docker-compose'
alias t="tmux"
alias gbinfo="~/.gitbranchinfo | bat"


# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_NODE_SHOW="false"

# pyenv vitualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"