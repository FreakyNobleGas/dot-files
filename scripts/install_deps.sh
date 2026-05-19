#
# Description: Script to install dependencies
#

# Install common dependencies
brew install starship
brew install --cask font-jetbrains-mono
brew install uv
brew install lazygit
brew install openjdk # For Groovy syntax support in NeoVim

# Install rbenv
# rbenv install --list
# rbenv install <version>
# rbenv global <version>
brew install rbenv ruby-build


# Install dependencies that I use on my personal machine
if [ "$USER" == "freakynoblegas" ]; then
  brew install --cask claude-code
fi

# To support image rendering in nvim markdown files
brew install imagemagick
