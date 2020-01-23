# setup my env


## dotbot

* `git clone https://github.com/Ehco1996/.dotfiles.git`


## shell

* zsh

    `yum install -y zsh`
    `chsh -s $(which zsh)`


    ```bash
    # if you zhs version <=5.2
    wget https://sourceforge.net/projects/zsh/files/zsh/5.4.2/zsh-5.4.2.tar.xz/download

    tar -xvJf download
    cd zsh-5.4.2/

    ./configure
    make && sudo make install

    rm -rf download zsh-5.4.2
    ```

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




