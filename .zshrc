# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export USER_HOME=/Users/dshevchuk

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

#export LANG=ru_RU.UTF-8

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


# Android setup
export ANDROID_HOME=$USER_HOME/Library/Android/sdk
PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

#Setup AndroidStudio vars - GRADLE
PATH=$PATH:"/Applications/Android Studio.app/Contents/gradle/gradle-4.6/bin/"

#Setup Android reverse engineering tools
PATH=$PATH:$USER_HOME/dev/androidZone/_RE/_tools

#Setup Maven
export MAVEN_HOME=$USER_HOME/Library/apache-maven-3.5.0
PATH=$PATH:$MAVEN_HOME/bin

#Setup Ant
export ANT_HOME=$USER_HOME/Library/apache-ant-1.10.1
PATH=$PATH:$ANT_HOME/bin

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Fluffer - https://flutter.io
PATH=$PATH:$USER_HOME/Library/flutter/bin

export PATH

# Personal configs
source ~/dev/.zshrc


# Aliases
alias vimrc="$EDITOR ~/.vimrc"
alias zshrc="$EDITOR ~/.zshrc"
alias tmuxrc="$EDITOR ~/.tmux.conf"

alias git_aliases='vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh'

alias mux='tmuxinator'
alias mc="/usr/local/Cellar/midnight-commander/4.8.22/libexec/mc/mc-wrapper.sh"
#alias flutter='/Users/dshevchuk/Library/flutter/bin/flutter'
alias ic="ionic cordova"
alias svim="docker run -it --rm spacevim/spacevim vim"
