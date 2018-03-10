#!/bin/bash

export RUN_PATH="`dirname \"$0\"`"
source $RUN_PATH/init.sh

export ZDOTDIR=$RUN_PATH

zsh -i 2>/dev/null

echo "Bye ~"
