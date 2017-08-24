# History options
HISTFILE="$HOME/.zsh_history"
HISTSIZE=20000
SAVEHIST=20000
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.


# Path to your oh-my-zsh installation.
export ZSH="$HOME"/.oh-my-zsh

# Two lined theme
# ZSH_THEME="suvash"
ZSH_THEME="Soliah"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(common-aliases python sudo zsh-autosuggestions zsh-syntax-highlighting fasd)

# gloablias expand aliases with 'space'
# sudo add sudo to the current command with ESC-ESC
# zsh-autosuggestions zsh-syntax-highlighting are autoexplicative

# User configuration

export PATH="/home/sbozzolo/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/home/sbozzolo/master_thesis/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# GNU pass
PASSWORD_STORE_DIR=$HOME/dotfiles/private/.password-store

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export VISUAL="emacsclient -nw"
    export EDITOR="emacsclient -nw"
    export ALTERNATE_EDITOR=""
else
    export VISUAL="emacsclient"
    export EDITOR="emacsclient"
    export ALTERNATE_EDITOR=""
fi

# Disable fucking annoying autocorrection
DISABLE_CORRECTION="true"

# Fix for some GTK errors
export NO_AT_BRIDGE=1

# Syntax highlight
if [ -d "$HOME/.linuxbrew" ]; then
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$HOME/.linuxbrew/share/zsh-syntax-highlighting/highlighters
    source $HOME/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

alias sim='simfactory/bin/sim'

if [ -f "$HOME/.my_remote_aliases" ]; then
    source ~/.my_remote_aliases
fi

if [ -f "$HOME/.zsh_aliases" ]; then
    source ~/.zsh_aliases
fi


# Set mail dir
export MAILDIR=~/.mail

# Autocompletion for simfactory
# autoload bashcompinit
# bashcompinit
# source /home/sbozzolo/master_thesis/einstein_toolkit/CaParma/simfactory/etc/bash_completion.d/sim

# Snippet to make term mode track the directory
chpwd() { print -P "\033AnSiTc %d" }

print -P "\033AnSiTu %n"
print -P "\033AnSiTc %d"

# If X is running run dailyupdater
if [[ ! -z $DISPLAY ]] ; then source dailyupdater; fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
