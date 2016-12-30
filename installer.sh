#!/bin/sh

echo "Welcome to sbozzolo's dotfiles!"
echo "I will symlink to $HOME"

for d in */ ; do
   sy=${d%?}
    while true; do
        read -p "Do you wish to symlink $sy ? " yn
        case $yn in
            [Yy]* ) stow -t ~ $sy;
                    if [ $? -eq 0 ]; then
                        echo "Symlinked $sy!"
                    else
                        echo "Error in symlinking $sy!"
                        exit
                    fi
                    break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
done
