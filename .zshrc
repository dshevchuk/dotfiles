# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export USER_HOME=/Users/dshev

export LANG=en_US.UTF-8

# set JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home -v 11)

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

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

alias vim9="/opt/homebrew/bin/vim"
export EDITOR="nvim"
export VISUAL="nvim"

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey -M vicmd '^s' history-incremental-search-backward
bindkey -M viins '^s' history-incremental-search-backward


# Setup PATH

# Personal local scripts
PATH=$PATH:$USER_HOME/bin

# Android setup
export ANDROID_HOME=$USER_HOME/Library/Android/sdk
PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# Setup AndroidStudio vars - GRADLE
#PATH=$PATH:"/Applications/Android Studio.app/Contents/gradle/gradle-4.6/bin/"

export PATH


# Personal dev configs
source ~/dev/.zshrc

# Homebrew setup
eval "$(/opt/homebrew/bin/brew shellenv)"


# Aliases
alias e="$EDITOR"
alias vimrc="$EDITOR ~/.vimrc"
alias zshrc="$EDITOR ~/.zshrc"
alias tmuxrc="$EDITOR ~/.tmux.conf"
alias nvimrc="$EDITOR ~/.config/nvim/init.vim"

alias git_aliases='vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh'
alias reload_zconf="source ~/.zshrc"

alias switch_to_java_8="export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)"
alias switch_to_java_11="export JAVA_HOME=$(/usr/libexec/java_home -v 11)"
alias switch_to_java_17="export JAVA_HOME=$(/usr/libexec/java_home -v 17)"

export JAVA_HOME=$(/usr/libexec/java_home -v 17)

alias c="clear"
alias godev="cd ~/dev"
alias l="colorls -l --sd"
alias ll="colorls -lA --sd"

alias adb-restart="adb kill-server && adb start-server"
alias adb-screenshot="adb exec-out screencap -p > $(date +"%Y-%m-%d_%H-%M-%S").png"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "/opt/homebrew/opt/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
## End setup fzf
