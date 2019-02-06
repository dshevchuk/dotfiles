# Personal setup of work environment
## oh-my-zsh
```shell
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

## tmux
```shell
brew install tmux
```

## vim
Install vim
```shell
brew install vim
```
Create simlink to vim config
```shell
n -s ~/.vim/gvimrc ~/.vimrc
```

Install Vundle
```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Install plugins by opening vim
```shell
$ vim ~/.vimrc
```
Run the following command in vim
```shell
:BundleInstall
```

## TODO
create install sh script
