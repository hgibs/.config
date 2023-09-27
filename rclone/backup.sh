#!/usr/bin/env bash

# rclone copy /users/hollandgibson nas:MacBook\ Time\ Machine/rclone/hollandgibson \
#   --config /Users/hollandgibson/.rclone/rclone.conf \
#   --metadata \
#   --copy-links \
#   --exclude "Movies/youtubes/**" \
#   --exclude "Movies/TV/**" \
#   --exclude "Desktop/TV&Movies/**" \
#   --exclude "Downloads/**" \
#   --exclude ".Trash**" \
#   --exclude ".cache/**" \
#   --exclude "Library**" \
#   --exclude "venv**" \
#   --exclude "miniforge**"

set -x
 
# started blue on Sep 2023
DESTINATION="nas:macbook14_backups/rclone/blue"
OPTIONS="--config /Users/hollandgibson/.config/rclone/rclone.conf --metadata -P"
rclone sync /Users $DESTINATION/Users $OPTIONS --exclude ".Trash**" --exclude ".npm" --exclude 'Library/Containers**' --exclude 'Library/Daemon Containers**'
rclone sync /Applications $DESTINATION/Applications $OPTIONS
rclone sync /opt $DESTINATION/opt $OPTIONS
rclone sync /private $DESTINATION/private $OPTIONS
