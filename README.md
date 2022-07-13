# Personal setup of work environment
## The list of items:
- oh-my-zsh
- Homebrew
- Tmux
- Git
- JDK
- Vim

 
## Install oh-my-zsh
```shell
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
Apply [.zshrc](/.zshrc)
## Install Homebrew
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install Tmux
```shell
brew install tmux
```
Apply config from [.tmux.conf](/.tmux.conf)

## Setup Git
Apple's model of Git comes preinstalled on macOS. Open up your Terminal or shell script editor of choice and enter git --version to verify which version of Git is on your machine. If not already on your machine, running git --version will prompt you to install Git.

After it you need create and add SSH keys, guide is here -> [Connecting to GitHub with SSH
](https://docs.github.com/en/authentication/connecting-to-github-with-ssh). In this case you could clone private repo via ssh, but it will be denied via https :( Open repos should be ok.

When you'll work with git all your metadata should be specified in project directory, in other case it will use `.gitconfig` from the USER_HOME directory. Create `.gitconfig` from [.gitconfig](https://github.com/dshevchuk/env_setup/blob/master/.gitconfig_template) and add [.gitignore_global](https://github.com/dshevchuk/env_setup/blob/master/.gitignore_global)ellow  is under review


## Instal JDK
For M1 Oracle adjust only version 17. For comform work we need version 8 and 11+ and ability to switch between them. 

[Azul Zulu](https://www.azul.com/downloads/?package=jdk#download-openjdk) based on OpenJDK and here is a 8 and 11 adapterd for M1. Install them.

JAVA_HOME and alias for switch between sdks located in [.zshrc](/.zshrc)


---- Text bellow is under review ----

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

----------------
PS: [Github basic writing and formatting syntax
](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
