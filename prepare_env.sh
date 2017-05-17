#!/bin/bash

# Check brew
hash brew 2>/dev/null || {
    echo "Installing LinuxBrew"
    echo "Checking dependencies"
    hash ruby 2>/dev/null || {
        echo >&2 "I require ruby but it's not installed. Install it manually.";
        exit 1;
    }
    hash gcc 2>/dev/null || {
        echo >&2 "I require gcc but it's not installed. Install it manually.";
        exit 1;
    }
    hash git 2>/dev/null || {
        echo >&2 "I require git but it's not installed. Install it manually.";
        exit 1;
    }

    echo "I will now set up LinuxBrew"
    git clone https://github.com/Homebrew/linuxbrew.git ~/.linuxbrew
    export HOMEBREW_PREFIX="$HOME/.linuxbrew"
    export PATH="$HOMEBREW_PREFIX/bin:$PATH"
    export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"
    export LD_LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LD_LIBRARY_PATH"
    export CPATH="$HOMEBREW_PREFIX/include:$CPATH"
    brew update
    brew doctor

}

# zsh
hash zsh 2>/dev/null || {
    echo >&2 "Installing zsh";
    brew install zsh
}

# stow
hash stow 2>/dev/null || {
    echo >&2 "Installing stow";
    brew install stow
}

# zsh-syntax-highlightning
if [ -d  "~/.linuxbrew/share/zsh-syntax-highlighting"]; then
    echo >&2 "Installing zsh-syntax-highlightning";
    brew install zsh-syntax-highlightning
fi

# oh my zsh
if [ -d "~/.oh-my-zsh/"]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# htop
hash htop 2>/dev/null || {
    echo >&2 "Installing htop";
    brew install htop
}

echo "Now you can install the dotfiles with ./installer.sh"
