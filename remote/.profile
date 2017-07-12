# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# set LIBRARY_PATH and LD_LBRARY_PATH so it includes user's private lib if it
# exists
if [ -d "$HOME/lib" ] ; then
    export LIBRARY_PATH="$HOME/lib:$LIBRARY_PATH"
    export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"

fi


# set LIBRARY_PATH and LD_LBRARY_PATH so it includes user's private lib if it
# exists
if [ -d "$HOME/include" ] ; then
    export CPATH="$HOME/include:$CPATH"
fi



# HomeBrew / LinuxBrew, if it's there
if [ -d "$HOME/.linuxbrew" ]; then
    export HOMEBREW_PREFIX="$HOME/.linuxbrew"
    export PATH="$HOMEBREW_PREFIX/bin:$PATH"
    export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"
    export LD_LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LD_LIBRARY_PATH"
    export CPATH="$HOMEBREW_PREFIX/include:$CPATH"
fi

# Set PS1 to > so that TRAMP can connect without any problem

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
