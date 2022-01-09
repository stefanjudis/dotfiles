#!/usr/bin/env sh

echo "#############################"
echo "# Installing various programs from brew"
echo "#############################"
echo ""

ROOT_DIR=$1
source "$ROOT_DIR/commands/__util.sh"

brew -v >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew_install_or_upgrade zsh
brew_install_or_upgrade zsh-completions

# set it as default shell
chsh -s /bin/zsh

brew_install_or_upgrade highlight
brew_install_or_upgrade jq
brew_install_or_upgrade autojump
brew_install_or_upgrade gh
brew_install_or_upgrade curl
brew_install_or_upgrade git
brew_install_or_upgrade git-delta
brew_install_or_upgrade go
brew_install_or_upgrade shellcheck
brew_install_or_upgrade fzf
brew_install_or_upgrade coreutils
brew_install_or_upgrade nektos/tap/act
brew_install_or_upgrade docker
brew_install_or_upgrade docker-machine
brew_install_or_upgrade git-lfs
brew_install_or_upgrade bluesnooze

# taps
brew tap cantino/mcfly
brew install mcfly

# rust based tools
brew_install_or_upgrade bat
brew_install_or_upgrade exa
brew_install_or_upgrade grex

# ffmpeg for quick video compression
brew install ffmpeg --with-vorbis --with-libvorbis --with-vorbis --with-theora --with-libogg --with-libvorbis --with-gpl --with-version3 --with-nonfree --with-postproc --with-libaacplus --with-libass --with-libcelt --with-libfaac --with-libfdk-aac --with-libfreetype --with-libmp3lame --with-libopencore-amrnb --with-libopencore-amrwb --with-libopenjpeg --with-openssl --with-libopus --with-libschroedinger --with-libspeex --with-libtheora --with-libvo-aacenc --with-libvorbis --with-libvpx --with-libx264 --with-libxvid

# *********************************
# mac app store
brew_install_or_upgrade mas
# magnet window management
mas install 441258766
# todoist
mas install 585829637
# NextDNS
mas install 1464122853
# Clocker
mas install id1056643111
# Meeting Bar
mas install 1532419400
# Hand mirror
mas install 1502839586

# ********************************
# paid apps
# https://apps.apple.com/us/app/rcmd-app-switcher/id1596283165
