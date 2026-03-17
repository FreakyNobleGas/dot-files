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

# Advanced git branch creation with naming conventions
gcb() {
    local branch_words=()
    local base_branch="main"
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -b|--base)
                base_branch="$2"
                shift 2
                ;;
            -h|--help)
                echo "Usage: gcb [options] <branch-name-parts...>"
                echo "Options:"
                echo "  -b, --base <branch>   Base branch to create from (default: main)"
                echo "  -h, --help           Show this help message"
                echo ""
                echo "Examples:"
                echo "  gcb 74 add player support    → 74-add-player-support"
                echo "  gcb fix login bug            → fix-login-bug"
                return 0
                ;;
            -*)
                echo "Unknown option: $1"
                echo "Use 'gcb --help' for usage information"
                return 1
                ;;
            *)
                branch_words+=("$1")
                shift
                ;;
        esac
    done
    
    # Validate branch name parts
    if [ ${#branch_words[@]} -eq 0 ]; then
        echo "Usage: gcb [options] <branch-name-parts...>"
        echo "Use 'gcb --help' for more information"
        return 1
    fi
    
    # Join words with hyphens and convert to lowercase
    local branch_name=$(printf "%s-" "${branch_words[@]}")
    branch_name=${branch_name%-}  # Remove trailing hyphen
    branch_name=$(echo "$branch_name" | tr '[:upper:]' '[:lower:]')
    
    # Check if branch already exists
    if git show-ref --verify --quiet "refs/heads/$branch_name"; then
        echo "Branch '$branch_name' already exists"
        read "response?Switch to existing branch? (y/N): "
        if [[ "$response" =~ ^[Yy]$ ]]; then
            git checkout "$branch_name"
        fi
        return 0
    fi
    
    # Ensure we're on the base branch and it's up to date
    echo "Switching to $base_branch and pulling latest changes..."
    git checkout "$base_branch" && git pull origin "$base_branch"
    
    # Create and checkout new branch
    if git checkout -b "$branch_name"; then
        echo "✓ Created and switched to branch '$branch_name'"
    else
        echo "✗ Failed to create branch '$branch_name'"
        return 1
    fi
}

# NVIM
export save_nvim_config() {
  rsync -av --exclude '.git' "$HOME/.config/nvim/" "$GITHUB_PATH/freakynoblegas/nvim-config/nvim/"
}
