#!/bin/bash

#
# Script Description: Install configuration files
#

# Save current dir and move to parent directory of the script
pushd "$(dirname "$0")/.." > /dev/null

# Create necessary directories if they don't exist
mkdir -p "$HOME/.oh-my-zsh/custom"
mkdir -p "$HOME/.config/ghostty"

# Install .oh-my-zsh custom plugins and themes
rsync -av ".oh-my-zsh/custom/" "$HOME/.oh-my-zsh/custom/"

# Install .zshrc
cp .zshrc "$HOME/.zshrc"

# Install Ghostty Config file
cp .config/ghostty/config "$HOME/.config/ghostty/config"

# Return to original directory
popd > /dev/null