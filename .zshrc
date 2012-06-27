# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gnzh"

# Example aliases
alias zshconfig="vi ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler brew gem adublin)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias sites='cd ~/Sites/'
alias desk='cd /Users/andredublin/Desktop'
alias dl='cd /Users/andredublin/Downloads'
alias home='cd ~'
alias ren=mv
alias up='cd ..'
alias r='rails'
alias ls='ls -Al'          # show hidden files
alias lx='ls -lb'         # sort by extension
alias lk='ls -lSr'         # sort by size
alias lc='ls -lcr'         # sort by change time
alias lu='ls -lur'         # sort by access time
alias lt='ls -ltr'         # sort by date
alias lm='ls -al | more'   # pipe through more
alias gps='ps -A | grep'   # list processes and regex search'
alias vim=vi
alias ex=exit
alias cl=clear
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pgrestart='pg_ctl restart'
alias pgctl='pg_ctl --help'
alias pg='psql'
alias mystart='mysql.server start'
alias mystop='mysql.server stop'
alias myrestart='mysql.server restart'
alias redis='redis-server /usr/local/etc/redis.conf'
alias apstart='sudo apachectl start'
alias apstop='sudo apachectl stop'
alias aprestart='sudo apachectl graceful'

# Android platform tools
export PATH=${PATH}:Android/tools:Android/platform-tools

# RVM
[[ -s "/Users/andredublin/.rvm/scripts/rvm" ]] && source "/Users/andredublin/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
