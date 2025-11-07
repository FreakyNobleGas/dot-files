##########################
# Oh-My-Zsh Configuration
##########################

# Settings Documentation:
# https://github.com/ohmyzsh/ohmyzsh/wiki/Settings

# Path to your Oh-My-Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Plugin Documentation:
# https://github.com/ohmyzsh/ohmyzsh/wiki/plugins
plugins=(zsh-autosuggestions zsh-syntax-highlighting docker docker-compose python)

source $HOME/sensitive-exports.zsh
source $ZSH/oh-my-zsh.sh

##########################
# User configuration
##########################

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Starship Documentation:
# https://starship.rs/
eval "$(starship init zsh)"
