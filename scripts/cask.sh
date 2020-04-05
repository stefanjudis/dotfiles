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

if [ -L ~/Library/Application\ Support/Code/user/settings.json ]; then
  echo "found old visual studio code settings. removing..."
  rm ~/Library/Application\ Support/Code/User/settings.json
fi

ln -s $ROOT_DIR/config/visual-studio-code-settings.json ~/Library/Application\ Support/Code/User/settings.json



echo "installing custom fonts"
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-oswald

brew cask install graphql-playground
brew cask install typora

brew tap jeroenknoops/tap
brew install gitin

brew cask install qlmarkdown
brew cask install firefox
brew cask install google-chrome-canary
brew cask install iterm2
brew cask install alfred
brew cask install wavebox
brew cask install zoomus
brew cask install spotify
brew cask install ngrok
brew cask install dashlane
brew cask install fantastical
brew cask install bartender
brew cask install choosy
brew cask install rocket
brew cask install notion
# enable audio and brightness control for ext screens
brew cask install monitorcontrol
