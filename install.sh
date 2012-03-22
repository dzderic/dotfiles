#!/bin/bash
CHECKOUT_DIR="$( cd "$( dirname "$0" )" && pwd )"
FILES="bash_profile tmux.conf vim vimrc zshrc"

read -p "Are you sure you want to clobber all your config files? (y/n)" -n 1
[[ ! $REPLY =~ ^[Yy]$ ]] && exit 1

echo

function symlink() {
    echo "Linking '$1' to '$2'"
    ln -s "$1" "$2"
}

cd $HOME

for FILE in $FILES; do
    symlink "$CHECKOUT_DIR/_$FILE" ".$FILE"
done
symlink $CHECKOUT_DIR/dircolors-solarized/dircolors.ansi-dark .dircolors
