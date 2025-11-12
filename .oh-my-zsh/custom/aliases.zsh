# PATHS
GITHUB_PATH="$HOME/Github/"
ZK_NOTEBOOK_DIR="$HOME/Documents/zk-notes/"

# SOURCE
source $GITHUB_PATH/freakynoblegas/nvim-config/env.sh

# NEOVIM
alias nv='nvim .'
alias open_nvim_config='cd ~/.config/nvim && nv && cd -'
alias edit_nvim_config="open_nvim_config"
alias update_nvim_config="cp -r $HOME/.config/nvim/ $GITHUB_PATH/freakynoblegas/nvim-config/nvim"

# GITHUB 
alias gs='git status'
alias lg='lazygit'

# PATH HELPERS
alias github_dir='cd $GITHUB_PATH'

# ZK
alias zk='zk --notebook-dir=$ZK_NOTEBOOK_DIR'
alias zkd='zk daily'
alias zkei='zk edit -i'

# ZSHRC
alias edit_zshrc='cd $ZSH_CUSTOM && nv && cd - && source ~/.zshrc'
