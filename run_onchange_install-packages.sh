#!/bin/zsh

# Brew packages
brew update
brew bundle --file="~/.config/brew/Brewfile"

# rtx packages
rtx install --install-missing
