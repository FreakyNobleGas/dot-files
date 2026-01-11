# PATHS
GITHUB_PATH="$HOME/Github"
NEOVIM_CONFIG_PATH="$HOME/.config/nvim"

# DOT FILES
export save_dot_files() {
  bash ${GITHUB_PATH}/freakynoblegas/dot-files/scripts/update.sh
}

# GITHUB
export gm() {
  if [ -z "$1" ]; then
    echo "Usage: gm <commit-message>"
    return 1
  fi
  git add .
  git commit -m "$*"
}

# NVIM
export save_nvim_config() {
  rsync -av --exclude '.git' "$HOME/.config/nvim/" "$GITHUB_PATH/freakynoblegas/nvim-config/nvim/"
}

export apply_nvim_config() {
  rm -rf "${NEOVIM_CONFIG_PATH}/"
  mkdir -p ${NEOVIM_CONFIG_PATH}
  rsync -av --exclude '.git' "$GITHUB_PATH/freakynoblegas/nvim-config/nvim/" "${NEOVIM_CONFIG_PATH}/"
}
