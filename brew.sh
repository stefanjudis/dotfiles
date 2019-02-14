#!/usr/bin/env sh

echo "\n"
echo "#############################"
echo "# Installing various programs from brew from brew.sh"
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
# ffmpeg for quick video compression
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# *********************************
# ffmpeg for quick video compression
brew install ffmpeg --with-vpx --with-vorbis --with-libvorbis --with-vpx --with-vorbis --with-theora --with-libogg --with-libvorbis --with-gpl --with-version3 --with-nonfree --with-postproc --with-libaacplus --with-libass --with-libcelt --with-libfaac --with-libfdk-aac --with-libfreetype --with-libmp3lame --with-libopencore-amrnb --with-libopencore-amrwb --with-libopenjpeg --with-openssl --with-libopus --with-libschroedinger --with-libspeex --with-libtheora --with-libvo-aacenc --with-libvorbis --with-libvpx --with-libx264 --with-libxvid

