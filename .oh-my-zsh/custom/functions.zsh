# PATHS
GITHUB_PATH="$HOME/Github/"

# DOT FILES
export save_dot_files() {
  rsync -av --exclude 'plugins' --exclude 'themes' "$HOME/.oh-my-zsh/custom/" "$GITHUB_PATH/dot-files/.oh-my-zsh/custom/"
  # cp -r $HOME/.oh-my-zsh/custom $GITHUB_PATH/dot-files/.oh-my-zsh/custom
  cp $HOME/.zshrc $GITHUB_PATH/dot-files/.zshrc
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
