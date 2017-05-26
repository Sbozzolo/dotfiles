# Set PS1 to > so that TRAMP can connect without any problem


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# HomeBrew / LinuxBrew, if it's there
if [ -d "$HOME/.linuxbrew" ]; then
    export HOMEBREW_PREFIX="$HOME/.linuxbrew"
    export PATH="$HOMEBREW_PREFIX/bin:$PATH"
    export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"
    export LD_LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LD_LIBRARY_PATH"
    export CPATH="$HOMEBREW_PREFIX/include:$CPATH"
fi

export SHELL=$(which zsh)
case "$TERM" in
"dumb")
        PS1="> "
        ;;
*)
    # If the terminal is not dumb then start zsh
        [ -z "$ZSH_VERSION" ] && exec $SHELL -l
        ;;
esac
