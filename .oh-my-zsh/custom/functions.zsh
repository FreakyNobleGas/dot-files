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

# Advanced git branch creation with naming conventions
gcb() {
    local branch_name=""
    local base_branch="main"
    local prefix=""
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            -f|--feature)
                prefix="feature/"
                shift
                ;;
            -b|--bugfix)
                prefix="bugfix/"
                shift
                ;;
            -h|--hotfix)
                prefix="hotfix/"
                shift
                ;;
            --base)
                base_branch="$2"
                shift 2
                ;;
            --help)
                echo "Usage: gcb [options] <branch-name>"
                echo "Options:"
                echo "  -f, --feature        Create feature branch (feature/branch-name)"
                echo "  -b, --bugfix         Create bugfix branch (bugfix/branch-name)"
                echo "  -h, --hotfix         Create hotfix branch (hotfix/branch-name)"
                echo "  --base <branch>      Base branch to create from (default: main)"
                echo "  --help               Show this help message"
                return 0
                ;;
            *)
                branch_name="$1"
                shift
                ;;
        esac
    done
    
    if [ -z "$branch_name" ]; then
        echo "Please provide a branch name"
        return 1
    fi
    
    # Clean up branch name (replace spaces with hyphens, lowercase)
    branch_name=$(echo "$branch_name" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
    full_branch_name="${prefix}${branch_name}"
    
    # Rest of the function similar to enhanced version...
    if git show-ref --verify --quiet "refs/heads/$full_branch_name"; then
        echo "Branch '$full_branch_name' already exists"
        git checkout "$full_branch_name"
        return 0
    fi
    
    git checkout "$base_branch" && git pull origin "$base_branch"
    git checkout -b "$full_branch_name"

    # Create and checkout new branch
    if git checkout -b "$branch_name"; then
        echo "✓ Created and switched to branch '$branch_name'"
        
        # Push to remote and set up tracking
        echo "Pushing to remote..."
        if git push -u origin "$branch_name"; then
            echo "✓ Branch pushed to remote and tracking set up"
        else
            echo "✗ Failed to push to remote (branch created locally)"
        fi
    else
        echo "✗ Failed to create branch '$branch_name'"
        return 1
    fi
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
