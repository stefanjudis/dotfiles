#!/usr/bin/env sh

brew -v >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "\n"
echo "#############################"
echo "# Installing various programs from brew"
echo "#############################"
echo "\n"

# *********************************
# zsh
brew install zsh zsh-completions
# set it as default shell
chsh -s /bin/zsh

# *********************************
# highlight

echo $'installing highlight'
brew unlink highlight
brew install highlight

# *********************************
# jq command line json parser
brew install jq

# *********************************
# Quick Look plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# *********************************
# ffmpeg for quick video compression
brew install ffmpeg --with-vpx --with-vorbis --with-libvorbis --with-vorbis --with-theora --with-libogg --with-libvorbis --with-gpl --with-version3 --with-nonfree --with-postproc --with-libaacplus --with-libass --with-libcelt --with-libfaac --with-libfdk-aac --with-libfreetype --with-libmp3lame --with-libopencore-amrnb --with-libopencore-amrwb --with-libopenjpeg --with-openssl --with-libopus --with-libschroedinger --with-libspeex --with-libtheora --with-libvo-aacenc --with-libvorbis --with-libvpx --with-libx264 --with-libxvid

# *********************************
# a better `cat`
brew install bat

# *********************************
# a better `cd`
brew install autojump

# *********************************
# a better `ll`
brew install exa

# *********************************
# GitHub CLI
brew install github/gh/gh
brew install curl

# *********************************
# mac app store
brew install mas
# magnet window management
mas install 441258766
# dato
mas install 1470584107
# todoist
mas install 585829637
