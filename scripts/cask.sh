#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Installing applications via cask from cask.sh"
echo "#############################"
echo ""

# get current location
ROOT_DIR=$1

echo "installing VSCode"
brew cask uninstall --force visual-studio-code && brew cask install visual-studio-code
brew cask uninstall --force visual-studio-code-insiders && brew cask install visual-studio-code-insiders

if [ -L ~/Library/Application\ Support/Code/user/settings.json ]; then
  echo "found old visual studio code settings. removing..."
  rm ~/Library/Application\ Support/Code/User/settings.json
fi

ln -s $ROOT_DIR/config/visual-studio-code-settings.json ~/Library/Application\ Support/Code/User/settings.json

brew tap homebrew/cask-versions

echo "installing custom fonts"
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-oswald
brew cask install font-ubuntu
# contentful slide font
brew cask install font-muli

brew cask install graphql-playground
brew cask install typora

brew tap jeroenknoops/tap
brew install gitin

brew cask install qlmarkdown
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefox
brew cask install iterm2
# install iterm utilities right away
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

brew cask install alfred
brew cask install wavebox
brew cask install zoomus
brew cask install spotify
brew cask install ngrok
brew cask install dashlane
brew cask install bartender
brew cask install choosy
brew cask install rocket
brew cask install notion
brew cask install monitorcontrol
brew cask install screenflow
