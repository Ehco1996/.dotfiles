# setup my env


## dotbot

* git clone https://github.com/Ehco1996/.dotfiles.git


## shell

* zsh

    `yum install -y zsh`
    `chsh -s $(which zsh)`

* oh-my-zsh

    `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

* zsh plugin

    `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

    `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

* spaceship-prompt for oh-my-zsh

    `git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"`

    `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"`

## cli tools

* sshw

    `https://github.com/yinheli/sshw`

* kubectl

* kubectx

## lang


* pyenv

        `curl https://pyenv.run | bash)`
* go




