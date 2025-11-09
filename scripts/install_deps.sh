#
# Description: Script to install dependencies
#

# Install common dependencies
brew install starship
brew install --cask font-jetbrains-mono
brew install uv

# Install dependencies that I use on my personal machine
if [ "$USER" == "freakynoblegas" ]; then
   brew install --cask claude-code 
fi