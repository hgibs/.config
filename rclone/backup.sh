#!/usr/bin/env bash

rclone copy /users/hollandgibson nas:MacBook\ Time\ Machine/rclone/hollandgibson \
  --config /Users/hollandgibson/.rclone/rclone.conf \
  --metadata \
  --copy-links \
  --exclude "Movies/youtubes/**" \
  --exclude "Movies/TV/**" \
  --exclude "Desktop/TV&Movies/**" \
  --exclude "Downloads/**" \
  --exclude ".Trash**" \
  --exclude ".cache/**" \
  --exclude "Library**" \
  --exclude "venv**" \
  --exclude "miniforge**"
  
