#!/bin/bash

#
# Script Description: Update configuration files in the repository
#

# Save current dir and move to script directory
pushd "$(dirname "$0")/.." > /dev/null

# Save .oh-my-zsh custom plugins and themes
rsync -av --exclude 'plugins' --exclude 'themes' "$HOME/.oh-my-zsh/custom/" ".oh-my-zsh/custom/"

# Save .zshrc
cp $HOME/.zshrc .zshrc

# Save Ghostty Config file
cp $HOME/.config/ghostty/config .config/ghostty/config

# Save Starship Config File
cp $HOME/.config/starship.toml .config/starship.toml

# Commit and push changes to GitHub
git add .
git commit -m "Update dot files"
git push origin main 

# Return to original directory
popd > /dev/null