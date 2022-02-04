# setup my env

## dotbot

* `git clone https://github.com/Ehco1996/.dotfiles.git`

* `pip install dotbot`

* `dotbot -c install.conf.yaml`

## font

* <https://github.com/ryanoasis/nerd-fonts>

## shell

* zsh

 `yum install -y zsh`

 `chsh -s $(which zsh)`

``` bash
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

* spaceship-prompt

`npm install -g spaceship-prompt`



* gvm

 `bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)`

* tmux

## cli tools

* sshw

 `https://github.com/Ehco1996/sshw`

 `go get -u github.com/Ehco1996/sshw/cmd/sshw`

* kubectl

* kubectx

* fzf

* fzf-tab

 `git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab`

 * https://github.com/junegunn/vim-plug


* zoxide https://github.com/ajeetdsouza/zoxide

    `brew install zoxide`
    `apt install zoxide`


## lang

* pyenv

 `curl https://pyenv.run | bash)`

* go
