#!/bin/bash

# This script will propose to create symlinks
# to home using stow

# Changelog (31/12/16 - sbozzolo)

# 0.2 - Added argument parsing. Arguments -h, -i, -d, -r, -I, -D, -R, -l
# 0.1 - Minimal stowing

version=0.2

# Output boldification
bold=$(tput bold)
normal=$(tput sgr0)

# Stores which packages have benn stowed
stowedfiles="stowed.dat"
if [ ! -f $stowedfiles ]; then
    touch $stowedfiles
fi

# Help
function show_help {
    echo "Sbozzolo's dotfiles version $version"
    echo
    # -i
    echo "$bold-i$normal: Interactvly install packages. Will ask for folder and packages."
    echo
    # -d
    echo "$bold-d$normal: Interactvly remove packages. Will ask for packages."
    echo
    # -r
    echo "$bold-d$normal: Interactvly relink packages. Will ask for packages."
    echo
    # -k
    echo "$bold-l$normal: Show installed packages."
    echo
    # -I
    echo "$bold-s$normal: Symlink single package to $HOME"
    echo "    Usage: $0 -I <package>"
    echo "    Example: $0 -I emacs"
    echo
    # -D
    echo "$bold-D$normal: Remove single package from $HOME"
    echo "    Usage: $0 -D <package>"
    echo "    Example: $0 -D emacs"
    echo
    # -R
    echo "$bold-R$normal: Relink single package to $HOME"
    echo "    Usage: $0 -R <package>"
    echo "    Example: $0 -R emacs"
    echo
    # -h
    echo "$bold-h$normal: Show this help"
    exit
}

# Interactivly install
function inter_install {

    # Choose folder
    where=$HOME

    while true; do
        read -p "Do you wish to symlink to $where ? " -n 1 yn
        echo
        case $yn in
            [Yy]* ) break;;
            [Nn]* )
                read -p "Where do you wish to symlink ? " where
                if [ ! -d "$where" ]; then
                    echo "Folder dosen't exist!"
                fi
                ;;
            * ) echo "Please answer y or n.";;
        esac
    done

    # Stowing
    for d in */ ; do
        sy=${d%?}
        while true; do
            read -p "Do you wish to symlink $bold$sy$normal? " -n 1 yn
            echo
            case $yn in
                [Yy]* ) stow -v -t ~ $sy;
                        if [ $? -eq 0 ]; then
                            echo "Symlinked $sy!"
                            stw="$sy $where"
                            if ! grep -q "$stw" $stowedfiles; then
                                echo $stw >> $stowedfiles
                            fi
                        else
                            echo "Error in symlinking $sy!"
                            exit
                        fi
                        break;;
                [Nn]* ) break;;
                * ) echo "Please answer y or n.";;
            esac
        done
    done

    echo "Done!"
    exit
}


# Interactivly uninstall
function inter_uninstall {

    if [[ ! -s $stowedfiles ]]; then
        echo "You haven't any package installed or have removed $stowedfiles!"
        exit
    fi

    while read -r -u 3 line;
    do
        pack=$(echo $line | cut -d ' ' -f 1)
        where=$(echo $line | cut -d ' ' -f 2)
        echo $pack $where
        while true; do
            read -p "Do you wish to remove $bold$pack$normal from $bold$where$normal? " -n  1 yn
            echo
            case $yn in
                [Yy]* ) stow -v -D -t ~ $pack;
                        if [ $? -eq 0 ]; then
                            echo "Removed $pack from $where!"
                            # Print $stowedfiles without $stw
                            sed -n '/$stw/!p' $stowedfiles > $stowedfiles
                        else
                            echo "Error in removing symlinking $pack from $where!"
                            exit
                        fi
                        break;;
                [Nn]* ) break;;
                * ) echo "Please answer y or n.";;
            esac
        done
    done 3< "$stowedfiles"

    echo "Done!"
    exit
}

# Interactivly relink
function inter_relink {

    if [[ ! -s $stowedfiles ]]; then
        echo "You haven't any package installed or have removed $stowedfiles!"
        exit
    fi
    while read -r -u 3 line;
    do
        pack=$(echo $line | cut -d ' ' -f 1)
        where=$(echo $line | cut -d ' ' -f 2)
        echo $pack $where
        while true; do
            read -p "Do you wish to relink $bold$pack$normal in $bold$where$normal? " -n  1 yn
            echo
            case $yn in
                [Yy]* ) stow -v -R -t ~ $pack;
                        if [ $? -eq 0 ]; then
                            echo "Relinked $pack in $where!"
                        else
                            echo "Error in relinking symlinking $pack in $where!"
                            exit
                        fi
                        break;;
                [Nn]* ) break;;
                * ) echo "Please answer y or n.";;
            esac
        done
    done 3< "$stowedfiles"

    echo "Done!"
    exit
}

# Argument parsing
while getopts ":hI:idrD:R:l" opt; do
    case $opt in
        i)
            inter_install
            exit;;
        r)
            inter_relink
            exit;;
        d)
            inter_uninstall
            exit;;
        h)
            show_help
            exit;;
        l)
            while read -r -u 3 line;
            do
                pack=$(echo $line | cut -d ' ' -f 1)
                where=$(echo $line | cut -d ' ' -f 2)
                echo "Package $bold$pack$normal installed in $bold$where$hormal"
            done 3< "$stowedfiles"
            exit;;
        I)
            if [ ! -d "$OPTARG" ]; then
                echo "Package dosen't exist!"
                echo "Available packages:"
                for d in */ ; do
                    echo ${d%?}
                done
                exit
            fi
            stow -v -t $HOME $OPTARG
            if [ $? -eq 0 ]; then
                stw="$OPTARG $HOME"
                if ! grep -q "$stw" $stowedfiles; then
                    echo $stw >> $stowedfiles
                fi
                echo "Symlinked $OPTARG in $HOME!"
            else
                echo "Error in symlinking $OPTARG in $HOME!"
            fi
            exit;;
        D)
            stw="$OPTARG $HOME"
            if ! grep -q "$stw" $stowedfiles; then
                echo "Package $OPTARG not found in $HOME!"
                exit
            fi
            stow -v -D -t ~ $OPTARG;
            if [ $? -eq 0 ]; then
                echo "Removed $OPTARG from $HOME!"
                sed -n '/$stw/!p' $stowedfiles > $stowedfiles
            else
                echo "Error in removing symlink $OPTARG from $HOME!"
                exit
            fi
            exit;;
        R)
            stw="$OPTARG $HOME"
            if ! grep -q "$stw" $stowedfiles; then
                echo "Package $OPTARG not found in $HOME!"
                exit
            fi
            stow -v -R -t ~ $OPTARG;
            if [ $? -eq 0 ]; then
                echo "Relinked $OPTARG in $HOME!"
            else
                echo "Error in relinking symlinking $OPTARG in $HOME!"
                exit
            fi
            exit;;
        :)
            echo "Option -$OPTARG requires an argument!"
            exit;;
        \?)
            echo "Invalid option: -$OPTARG"
            exit;;
    esac
done

# echo "Welcome to sbozzolo's dotfiles!"
