#!/bin/bash

DOTFILES_DIR=`pwd`
BASE=`basename $DOTFILES_DIR`
if [ $BASE != 'dotfiles' ]; then
    echo "Idiot, run this script underneath dotfiles"
    exit
fi

if [ ! -f README.md ]; then
    echo "Moron, this appears not the dotfiles directory from Github.com"
    exit
fi


OLDDIR=~/dotfiles_old
DOTFILES="bashrc vimrc vim"

echo "Creating $OLDDIR for backup of any existing dotfiles in ~"
mkdir -p $OLDDIR
echo "...done"

for file in ${DOTFILES[@]}; do
    if [ -e ~/.$file -a ! -h ~/.$file ]; then
        echo "Moving existing .$file from ~ to $OLDDIR"
        mv ~/.$file $OLDDIR
    fi

    echo "Creating symlink to $file in home directory."
    ln -s $DOTFILES_DIR/$file ~/.$file
done
