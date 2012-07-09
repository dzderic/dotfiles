#!/bin/bash
CHECKOUT_DIR="$( cd "$( dirname "$0" )" && pwd )"
FILES="bash_profile tmux.conf vim vimrc zshrc gitconfig minttyrc"

read -p "Are you sure you want to clobber all your config files? (y/n)" -n 1
[[ ! $REPLY =~ ^[Yy]$ ]] && exit 1
echo

cd $HOME

function symlink() {
    if [[ ! -a "$2" ]]; then
        echo "Linking '$1' to '$2'"
        ln -s "$1" "$2"
    fi
}

for FILE in $FILES; do
    # Remove the old config if it's not a symlink
    [ -f ".$FILE" ] && [ ! -L ".$FILE" ] && rm -f ".$FILE"

    # Symlink the config to the one in the repo
    symlink "$CHECKOUT_DIR/_$FILE" ".$FILE"
done
symlink "$CHECKOUT_DIR/dircolors-solarized/dircolors.ansi-dark" .dircolors
