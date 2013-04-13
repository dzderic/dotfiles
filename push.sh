#!/bin/bash
REMOTE="$1"
REMOTE_DIR=".dotfiles"

CHECKOUT_DIR="$( cd "$( dirname "$0" )" && pwd )"

rsync -avz "$CHECKOUT_DIR/" "$REMOTE:$REMOTE_DIR/"
ssh "$REMOTE" "cd '$REMOTE_DIR' && yes | ./install.sh"
