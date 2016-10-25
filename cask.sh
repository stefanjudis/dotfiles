# get current location
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )






## install visual studi code
brew cask uninstall --force visual-studio-code && brew cask install visual-studio-code

if [ -L ~/Library/Application\ Support/Code/user/settings.json ]; then
  echo "found old visual studio code settings. removing..."
  rm ~/Library/Application\ Support/Code/User/settings.json
fi

ln -s $DIR/visual-studio-code-settings.json ~/Library/Application\ Support/Code/User/settings.json
