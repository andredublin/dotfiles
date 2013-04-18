# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="andre"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git github zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Source .aliases
if [ -e "$HOME/.aliases" ]; then
  source  "$HOME/.aliases"
fi

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="$PATH:/usr/local/sbin"

# use vim as visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# try to correct command line spelling
setopt CORRECT CORRECT_ALL

# ignore duplicate history
setopt histignoredups
