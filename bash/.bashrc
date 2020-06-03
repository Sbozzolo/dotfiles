# It is not advised to set fish as login shell
# https://bugs.gentoo.org/show_bug.cgi?id=545830
# The workaround is to keep the default shell to
# bash, and run fish from there

if [[ $- != *i* ]] ; then
        # Shell is non-interactive. Be done now!
        return
fi

# Start directly in the WM if the TTY is TTY1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]
then
    exec startx
else
    # Keep this line at the bottom of ~/.bashrc
    [ -x /bin/fish ] && SHELL=/bin/fish exec /bin/fish
fi
