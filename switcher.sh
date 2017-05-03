#!/usr/bin/bash

# Swtiches git repo for GitHub or Bitbucket

# Argument parsing
while getopts "bg" opt; do
    case $opt in
        b)
            rm -f .git
            ln -s -v /home/sbozzolo/dotfiles/.gitBucket .git
            exit;;
        g)
            rm -f .git
            ln -s -v /home/sbozzolo/dotfiles/.gitHub .git
            exit;;
        \?)
            echo "Invalid option: -$OPTARG"
            exit;;
    esac
done

# If no argoments is provided print current value
now=$(readlink -f .git | cut -d"/" -f5 | sed 's/.//')
echo "Currently using $now"
