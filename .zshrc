# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export USER_HOME=/Users/dshevchuk

export LANG=en_US.UTF-8

# unset JAVA_HOME
# export JAVA_HOME=$(/usr/libexec/java_home -v "1.8.301.09")

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# ZLE config
bindkey -v
export KEYTIMEOUT=1

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

export EDITOR=vim
export VISUAL=vim

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey -M vicmd '^s' history-incremental-search-backward
bindkey -M viins '^s' history-incremental-search-backward

# Personal local scripts
PATH=$PATH:$USER_HOME/bin

# Android setup
export ANDROID_HOME=$USER_HOME/Library/Android/sdk
PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# Setup AndroidStudio vars - GRADLE
PATH=$PATH:"/Applications/Android Studio.app/Contents/gradle/gradle-4.6/bin/"

# Setup Maven
export MAVEN_HOME=$USER_HOME/Library/apache-maven-3.5.0
PATH=$PATH:$MAVEN_HOME/bin

# Setup Ant
export ANT_HOME=$USER_HOME/Library/apache-ant-1.10.1
PATH=$PATH:$ANT_HOME/bin

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Fluffer - https://flutter.io
PATH=$PATH:$USER_HOME/Library/flutter/bin

# fix java setup for BigSur
PATH=$PATH:/Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home/bin
#export JAVA_HOME=/Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home
export JAVA_HOME=/Applications/"Android Studio 4.app"/Contents/jre/Contents/Home

export PATH

# Personal configs
source ~/dev/.zshrc


# Aliases
alias e="$EDITOR"
alias vimrc="$EDITOR ~/.vimrc"
alias zshrc="$EDITOR ~/.zshrc"
alias tmuxrc="$EDITOR ~/.tmux.conf"
alias nvimrc="$EDITOR ~/.config/nvim/init.vim"

alias git_aliases='vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh'
alias reload_zconf="source ~/.zshrc"

alias mux='tmuxinator'
alias mc="/usr/local/Cellar/midnight-commander/4.8.22/libexec/mc/mc-wrapper.sh"
alias ic="ionic cordova"
alias adb-restart="adb kill-server && adb start-server"
alias lcat="adb logcat -v color"
alias godev="cd ~/dev"
alias c="clear"
alias dartd="dart --enable-asserts"
alias fl="flutter"
alias dex2jar="sh /Users/dshevchuk/Library/Android/dex2jar/d2j-dex2jar.sh -f"

alias ktr="sh ktrun.sh"
alias kts="kotlinc -script " 

alias timeAttendance="vim ~/GoogleDrive/timeAttendance.md"

# adb -s 10.50.50.124:5555 exec-out screencap -p > $(date +"%Y-%m-%d_%H-%M-%S").png
alias adb-screenshot="adb exec-out screencap -p > $(date +"%Y-%m-%d_%H-%M-%S").png"


# NVM to manage Node and npm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/dshevchuk/.sdkman"
[[ -s "/Users/dshevchuk/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dshevchuk/.sdkman/bin/sdkman-init.sh"
