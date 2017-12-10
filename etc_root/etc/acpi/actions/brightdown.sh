#!/bin/sh

if [ ! $(xbacklight -get) -le 2 ]
then
    xbacklight -2
fi
