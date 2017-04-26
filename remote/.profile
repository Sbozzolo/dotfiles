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
