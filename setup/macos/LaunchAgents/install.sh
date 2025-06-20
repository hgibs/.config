#!/usr/bin env bash

cp *.plist $HOME/Library/LaunchAgents

# see https://www.launchd.info/

launchctl enable gui/501 $HOME/Library/LaunchAgents/com.hollandgibson.brew-list
launchctl enable gui/501 $HOME/Library/LaunchAgents/com.hollandgibson.brew-update
launchctl enable gui/501 $HOME/Library/LaunchAgents/com.hollandgibson.daily-backup
launchctl enable gui/501 $HOME/Library/LaunchAgents/com.hollandgibson.tldr-update

launchctl list | grep hollandgibson

log stream --predicate 'subsystem == "com.hollandgibson"'
