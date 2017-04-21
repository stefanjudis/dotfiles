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

# *********************************
# jq command line json parser
brew install jq


# *********************************
# ffmpeg for quick video compression
brew install ffmpeg --with-vpx --with-vorbis --with-libvorbis --with-vpx --with-vorbis --with-theora --with-libogg --with-libvorbis --with-gpl --with-version3 --with-nonfree --with-postproc --with-libaacplus --with-libass --with-libcelt --with-libfaac --with-libfdk-aac --with-libfreetype --with-libmp3lame --with-libopencore-amrnb --with-libopencore-amrwb --with-libopenjpeg --with-openssl --with-libopus --with-libschroedinger --with-libspeex --with-libtheora --with-libvo-aacenc --with-libvorbis --with-libvpx --with-libx264 --with-libxvid
