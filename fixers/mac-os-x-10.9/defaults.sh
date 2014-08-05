#!/bin/bash -e

# set the default screenshot folder to something other than the desktop
mkdir -p ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots
killall SystemUIServer
