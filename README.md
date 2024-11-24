# Personal setup of work environment
## The list of items:
- oh-my-zsh
- Homebrew
- Git
- JDK
- iTerm
- Vim (outdated, too old)
- NeoVim
- Tmux
- Tools

 
## Install oh-my-zsh
```shell
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
Apply [.zshrc](/.zshrc)
## Install Homebrew
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Setup Git
Apple's model of Git comes preinstalled on macOS. Open up your Terminal or shell script editor of choice and enter git --version to verify which version of Git is on your machine. If not already on your machine, running git --version will prompt you to install Git.

After it you need create and add SSH keys, guide is here -> [Connecting to GitHub with SSH
](https://docs.github.com/en/authentication/connecting-to-github-with-ssh). In this case you could clone private repo via ssh, but it will be denied via https :( Open repos should be ok.

When you'll work with git all your metadata should be specified in project directory, in other case it will use `.gitconfig` from the USER_HOME directory. Create `.gitconfig` from [.gitconfig](https://github.com/dshevchuk/env_setup/blob/master/.gitconfig_template) and add [.gitignore_global](https://github.com/dshevchuk/env_setup/blob/master/.gitignore_global) bellow is under review


## Instal JDK
For M1 Oracle adjust only version 17. For comform work we need version 8 and 11+ and ability to switch between them. 

[Azul Zulu](https://www.azul.com/downloads/?package=jdk#download-openjdk) based on OpenJDK and here is a 8 and 11 adapterd for M1. Install them.

JAVA_HOME and alias for switch between sdks located in [.zshrc](/.zshrc)

## iTerm
```shell
brew install --cask iterm2
```
**Powerlevel10k** - https://github.com/romkatv/powerlevel10k
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
Docs about fonts for Powerlevel10k - https://github.com/romkatv/powerlevel10k/blob/master/font.md

**NerdFonts** - https://www.nerdfonts.com/font-downloads

**Nord theme ports** - https://www.nordtheme.com/ports

**ColorLS** - https://github.com/athityakumar/colorls

Install the colorls ruby gem with `gem install colorls`


## vim (outdated, use NeoVim)
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


## NeoVim
```shell
brew install neovim
```
Base setup and configuration with Lua - https://www.youtube.com/watch?v=J9yqSdvAKXY

Kickstart.nvim - https://github.com/nvim-lua/kickstart.nvim


## Install Tmux
```shell
brew install tmux
```
Apply config from [.tmux.conf](/.tmux.conf)

Install [TMP](https://github.com/tmux-plugins/tpm) (Tmux plugin manager)

Nice quick guide - https://www.youtube.com/watch?v=H70lULWJeig

Tmux guide from **thoughtbot** - https://thoughtbot.com/blog/a-tmux-crash-course

_TBD: Do I need a tmuxinator? template layout composition of tmux panes_



## Install Tmux
```shell
brew install tmux
```
Apply config from [.tmux.conf](/.tmux.conf)

Install [TMP](https://github.com/tmux-plugins/tpm) (Tmux plugin manager)

Nice quick guide - https://www.youtube.com/watch?v=H70lULWJeig

Tmux guide from **thoughtbot** - https://thoughtbot.com/blog/a-tmux-crash-course

_TBD: Do I need a tmuxinator? template layout composition of tmux panes_


## Tools
- **Btop** instead of Htop or top - https://github.com/aristocratos/btop
- **Bat**, a cat(1) clone with syntax highlighting and Git integration - https://github.com/sharkdp/bat
- **CMatrix**, Matrix like effect in your terminal - https://github.com/abishekvashok/cmatrix


PS: [Github basic writing and formatting syntax
](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
