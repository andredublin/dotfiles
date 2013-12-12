# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="andre"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Source .aliases
if [ -e "$HOME/.aliases" ]; then
  source  "$HOME/.aliases"
fi

# Source autoenv
source /usr/local/opt/autoenv/activate.sh

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if
  which rbenv > /dev/null;
  then eval "$(rbenv init -)";
fi

# append sbin for homebrew
export PATH="$PATH:/usr/local/sbin"
# append npm binaries
export PATH="$PATH:/usr/local/share/npm/bin"
# append packer binaries
export PATH="$PATH:/usr/local/packer"

# vim forever!
export EDITOR="vim"

export GIT_MERGE_AUTOEDIT=no

# try to correct command line spelling
setopt CORRECT CORRECT_ALL

# ignore duplicate history
setopt histignoredups

# don't share history
unsetopt share_history
