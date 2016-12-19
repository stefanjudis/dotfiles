#!/usr/bin/env sh

echo "\n"
echo "#############################"
echo "# Installing various programs from brew from brew.sh"
echo "#############################"
echo "\n"

# *********************************
# pokemon say
#

echo $'installing pokemonsay\n'
brew install fortune

brew unlink coreutils
brew install coreutils
brew link coreutils

ln -s /usr/local/bin/gshuf /usr/local/bin/shuf

if [ -d ~/Projects/pokemonsay ]; then
  echo "found pokemonsay dir - removing..."
  rm -rf ~/Projects/pokemonsay
fi

echo $'cloning pokemonsay'
git clone http://github.com/possatti/pokemonsay ~/Projects/pokemonsay && cd ~/Projects/pokemonsay && ./install.sh

brew install cowsay

# *********************************
# highlight

echo $'installing highlight'
brew unlink highlight
brew install highlight

# *********************************
# httpstat

echo $'installing httpstat'
brew unlink httpstat
brew install httpstat

# *********************************
# phantomjs
brew install phantomjs