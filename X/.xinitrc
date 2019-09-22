# You may need to comment out the next line to disable access control
xhost +

# Set themes, etc
#/usr/lib/gnome-settings-daemon/gnome-settings-daemon &

# Set fallback cursor
xsetroot -cursor_name left_ptr

# Set keyboard repeat rate
xset r rate 200 60

# Deactivate the screen after 5 minutes
xset +dpms
xset dpms 0 0 300

# Xresources configurations
if [ -f ~/.Xresources ]; then
    xrdb -merge  ~/.Xresources
fi

# Xmodmap to change CAPS LOCK to Return
if [ -f ~/.Xresources ]; then
    xmodmap ~/.Xmodmap
fi

# Hardware dependent
if [ -f ~/.Xhardware ]; then
    source ~/.Xhardware
fi

# If Emacs is started in server mode, `emacsclient` is a convenient way to edit
# files in place (used by e.g. `git commit`)
export VISUAL=emacsclient
export EDITOR="$VISUAL"

# Bind brightness keys, now with hwdb
# pgrep xbindkeys &> /dev/null || xbindkeys &> /dev/null &

# Redshift
pgrep redshift &> /dev/null || redshift -c ~/.redshiftrc &> /dev/null &

# Finally launch emacs

# exec dbus-launch emacs -Q -L /home/sbozzolo/.emacs.d/elpa/exwm-0.22.1/ -L /home/sbozzolo/.emacs.d/elpa/xelb-0.17/ -L /home/sbozzolo/.emacs.d/lisp/emacs-libvterm/ \
#     --eval "(setq debug-on-error t)" \
#     --eval "(setq debug-all-forms t)" \
#     --eval "(require 'exwm)" \
#     --eval "(require 'exwm-config)" \
#     --eval "(require 'vterm)" \
#     --eval "(exwm-config-default)" \
#     --eval "(exwm-init)";


exec dbus-launch --exit-with-session emacs --debug-init  #--exit-with-session emacs --debug-init
