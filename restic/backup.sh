#!/usr/bin/env bash

date

# password is in the password.secret file
if pmset -g ps | head -n 1 | grep -q 'AC Power'; then
  source $HOME/.config/restic/password.secret
  /opt/homebrew/bin/restic -r sftp:macb14@nas.home.hollandgibson.com:/mnt/Saturn/macbook14/restic/teal cat config
  /opt/homebrew/bin/restic -r sftp:macb14@nas.home.hollandgibson.com:/mnt/Saturn/macbook14/restic/teal backup "$HOME"
else
  printf "Must be plugged into AC power to backup\n" >&2
fi
