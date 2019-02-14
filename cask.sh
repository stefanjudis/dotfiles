#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Installing applications via cask from cask.sh"
echo "#############################"
echo ""

# get current location
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# *********************************
# Visual studio code
brew cask uninstall --force visual-studio-code && brew cask install visual-studio-code

if [ -L ~/Library/Application\ Support/Code/user/settings.json ]; then
  echo "found old visual studio code settings. removing..."
  rm ~/Library/Application\ Support/Code/User/settings.json
fi

ln -s $DIR/visual-studio-code-settings.json ~/Library/Application\ Support/Code/User/settings.json


# *********************************
# pretty markdown preview
echo $'installing pretty markdown preview'
brew cask install qlmarkdown


# *********************************
# fira code
echo "installing fira code"
brew tap caskroom/fonts
brew cask install font-fira-code

# *********************************
brew cask install graphql-playground

# *********************************
# markdown client
brew cask install typora

# *********************************
# a better `cat`
brew install bat

# *********************************
# a better `cd`
brew install autojump
brew install exa

brew tap jeroenknoops/tap
brew install gitin

brew cask install firefox
brew cask install iterm2
brew cask install alfred
brew cask install wavebox
brew cask install zoomus
