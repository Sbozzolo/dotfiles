# You may need to comment out the next line to disable access control
#xhost +

# Set themes, etc
#/usr/lib/gnome-settings-daemon/gnome-settings-daemon &

# Set fallback cursor
xsetroot -cursor_name left_ptr

# Set keyboard repeat rate
xset r rate 200 60

# Xresources configurations
if [ -f ~/.Xresources ]; then
    xrdb -merge  ~/.Xresources
fi

# [[ -f ~/.Xresources ]] && xrdb -merge -I $HOME ~/.Xresources

# Xmodmap to change CAPS LOCK to Return
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# Hardware dependant
if [ -f ~/.Xhardware ]; then
    source ~/.Xhardware
fi

# If Emacs is started in server mode, `emacsclient` is a convenient way to edit
# files in place (used by e.g. `git commit`)
export VISUAL=emacsclient
export EDITOR="$VISUAL"

# Bind brightness keys
xbindkeys &

# Redshift
redshift -c ~/.redshiftrc &

# Finally launch emacs
exec dbus-launch --exit-with-session emacs --debug-init
