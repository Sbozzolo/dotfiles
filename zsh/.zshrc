# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History options
HISTFILE="$HOME/.zsh_history"
HISTSIZE=20000
SAVEHIST=20000
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

# PATH
# Add also sbin to use auto completion with sudo
export PATH="/usr/sbin:/sbin":$PATH
export PATH="$HOME/bin":$PATH

export LD_LIBRARY_PATH="/usr/local/lib":$LD_LIBRARY_PATH


export PYTHONSTARTUP=~/.pythonrc

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

plugins=(common-aliases python autojump)

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
    if [ -f $HOME/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source $HOME/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi
else
    if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    else
        if [ -f  /usr/share/zsh/site-contrib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
            source  /usr/share/zsh/site-contrib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        fi
    fi
fi

if [ -d "$HOME/.linuxbrew" ]; then
    if [ -f $HOME/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source $HOME/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi
else
    if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    else
        if [ -f  /usr/share/zsh/site-contrib/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
            source  /usr/share/zsh/site-contrib/zsh-autosuggestions/zsh-autosuggestions.zsh
        fi
    fi
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'

alias sim='simfactory/bin/sim'

if [ -f "$HOME/.my_remote_aliases" ]; then
    source ~/.my_remote_aliases
fi

if [ -f "$HOME/.zsh_aliases" ]; then
    source ~/.zsh_aliases
fi

if [ -f "$HOME/.zsh_functions" ]; then
    source ~/.zsh_functions
fi

# Set mail dir
export MAILDIR=~/.mail

# Autocompletion for simfactory
# autoload bashcompinit
# bashcompinit
# source /home/sbozzolo/master_thesis/einstein_toolkit/CaParma/simfactory/etc/bash_completion.d/sim

# Snippet to make term mode track the directory
DISABLE_AUTO_TITLE="true"
HOSTNAME=$(uname -n)
USER=$(whoami)

function chpwd() {
    print -Pn "\e]51;A$(pwd)\e\\";
}

# case $TERM in
# # for emacs vterm.el
#     (*xterm*|*rxvt*|(dt|k)term*))
#         lastcmd=""
#         sync_dir() {
#             cmd="$1"
#             tokens=(${(s/ /)cmd}) # split by space
#             lastcmd=$tokens[1]
#             print -Pn "\e]2;${USER}@${HOSTNAME}@${lastcmd}:%~\a" #set title user@host@cmd:path
#         }
#         print -Pn "\e]2;${USER}@${HOSTNAME}@${lastcmd}:%~\a" #set title user@host@cmd:path
#         ;;
#         # for term
#         (*eterm*)
#         sync_dir() {
#             print -P "\033AnSiTu" "${USER}"
#             print -P "\033AnSiTh" "${HOSTNAME}"
#             print -P "\033AnSiTc %d"
#         }
#         ;;
# esac

# Call prmptcmd whenever prompt is redrawn
[[ ! $(tty) =~ /dev/tty[0-9] ]] && precmd_functions=($precmd_functions sync_dir)

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]
then
    exec startx
fi

# # Workaround for redshift
# pgrep redshift &> /dev/null || nohup redshift -c ~/.redshiftrc &> /dev/null &

# Gentoo completions

autoload -U compinit promptinit
compinit
# promptinit; prompt gentoo

zstyle ':completion::complete:*' use-cache 1
