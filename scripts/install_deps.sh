#
# Description: Script to install dependencies
#

# Install common dependencies
brew install starship
brew install --cask font-jetbrains-mono
brew install uv

# Install rbenv
# rbenv install --list
# rbenv install <version>
# rbenv global <version>
brew install rbenv ruby-build

# Install Language Servers for NeoVim
brew install lua-language-server
brew install typescript-language-server
brew install pyright
brew install yaml-language-server
brew install vscode-langservers-extracted # HTML, CSS, JSON Language Servers

gem install solargraph # Ruby Language Server

npm install -g svelte-language-server
npm install -g dockerfile-language-server-nodejs

# Install dependencies that I use on my personal machine
if [ "$USER" == "freakynoblegas" ]; then
   brew install --cask claude-code 
fi