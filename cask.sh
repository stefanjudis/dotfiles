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
