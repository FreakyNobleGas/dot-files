# PATHS
GITHUB_PATH="$HOME/Github"

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
