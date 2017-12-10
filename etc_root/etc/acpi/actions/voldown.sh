#!/bin/sh
if amixer get Master | grep -q "off"
then
    amixer -q sset Master unmute
    amixer -q sset Master 3%-
else
    amixer -q sset Master 3%-
fi
