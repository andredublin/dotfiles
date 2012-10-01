# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github bundler brew gem rvm adublin zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Android platform tools
export PATH=${PATH}:Android/tools:Android/platform-tools

# RVM
[[ -s "/Users/andredublin/.rvm/scripts/rvm" ]] && source "/Users/andredublin/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Source .aliases
. ~/.aliases

# ZSN_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
