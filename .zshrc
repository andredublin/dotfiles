# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="andre"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(zsh-syntax-highlighting, autoenv, bower, colorize, common-aliases, docker, go)

source $ZSH/oh-my-zsh.sh

# Load shell files
for file in ~/.{aliases,functions,exports}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# try to correct command line spelling
setopt CORRECT CORRECT_ALL

# ignore duplicate history
setopt histignoredups

# don't share history
unsetopt share_history
