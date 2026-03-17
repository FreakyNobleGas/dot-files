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

# Install Starship Config file
cp .config/starship.toml "$HOME/.config/starship.toml"

# Install ZK config and templates
if [ -z "$ZK_NOTEBOOK_DIR" ]; then
  echo "Error: ZK_NOTEBOOK_DIR is not set. Skipping ZK config install."
  echo "Set it in your shell config and re-run this script."
  exit 1
fi
mkdir -p "$ZK_NOTEBOOK_DIR/.zk/templates"
mkdir -p "$ZK_NOTEBOOK_DIR/meetings"
mkdir -p "$ZK_NOTEBOOK_DIR/journal"
cp zk/config.toml "$ZK_NOTEBOOK_DIR/.zk/config.toml"
rsync -av zk/templates/ "$ZK_NOTEBOOK_DIR/.zk/templates/"

# Return to original directory
popd > /dev/null