#!/bin/bash
# .make.sh 
# This script creates symlinks from ~/ to dotfiles dir

dir=~/.my-config
olddir=~/.my-config_old
files=".zshrc .gitconfig"

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...complete."

echo "Changing to the $dir directory"
cd $dir
echo "...complete."

for file in $files; do
    echo "Moving existing dotfiles from ~ to $olddir"
    mv ~/$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
