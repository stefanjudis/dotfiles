#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Installing applications via cask from cask.sh"
echo "#############################"
echo ""

# get current location
ROOT_DIR=$1

echo "installing VSCode"
brew uninstall --cask --force visual-studio-code && brew install --cask visual-studio-code
brew uninstall --cask --force visual-studio-code-insiders && brew install --cask visual-studio-code-insiders

if [ -L ~/Library/Application\ Support/Code/user/settings.json ]; then
  echo "found old visual studio code settings. removing..."
  rm ~/Library/Application\ Support/Code/User/settings.json
fi

ln -s $ROOT_DIR/config/visual-studio-code-settings.json ~/Library/Application\ Support/Code/User/settings.json

brew tap homebrew/cask-versions

echo "installing custom fonts"
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-oswald
brew install --cask font-ubuntu
# contentful slide font
brew install --cask font-muli

brew install --cask graphql-playground
brew install --cask typora

brew tap jeroenknoops/tap
brew install gitin

brew install --cask qlmarkdown
brew install --cask google-chrome
brew install --cask google-chrome-canary
brew install --cask firefox
brew install --cask firefox-nightly
brew install --cask iterm2
# install iterm utilities right away
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

brew install --cask alfred
brew install --cask wavebox
brew install --cask zoomus
brew install --cask spotify
brew install --cask ngrok
brew install --cask dashlane
brew install --cask bartender
brew install --cask choosy
brew install --cask rocket
brew install --cask monitorcontrol
brew install --cask screenflow
