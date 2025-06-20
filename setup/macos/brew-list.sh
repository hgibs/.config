#!/usr/bin/env bash

LEAVES_FILE="/Users/hollandgibson/.config/setup/macos/brew-leaves.txt"
printf "# created by ~/.config/setup/macos/brew-list.sh on %\n" "$(date)" > $LEAVES_FILE
/opt/homebrew/bin/brew leaves >> $LEAVES_FILE

CASKS_FILE="/Users/hollandgibson/.config/setup/macos/brew-casks.txt"
printf "# created by ~/.config/setup/macos/brew-list.sh on %\n" "$(date)" > $CASKS_FILE
/opt/homebrew/bin/brew list --cask >> $CASKS_FILE
