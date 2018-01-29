#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Running global npm setup from npm.sh"
echo "#############################"
echo ""

# *************************************
# node
#
echo $'installing node via nvm'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash
echo $'installed nvm\n'

# loading nvm for now
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install stable
nvm alias default stable
nvm use stable

echo $'updating npm\n'
npm i -g npm

echo -e "\n\nGlobal installed npm modules"
echo "=============================="

echo "Installing trash-cli"
npm i -g trash-cli
echo "Installing live-server"
npm i -g live-server
echo "Installing http-server"
npm i -g http-server
echo "Installing svgo"
npm i -g svgo
echo "Installing commitizen"
npm i -g commitizen
echo "Installing wifi"
npm i -g manage-wifi-cli
echo "Installing wifi-password-cli"
npm i -g wifi-password-cli
echo "Installing imagemin-cli"
npm i -g imagemin-cli
echo "Installing browserify"
npm i -g browserify
echo "Installing git-recall"
npm i -g git-recall
echo "Installing prettyjson"
npm i -g prettyjson
echo "Installing fkill"
npm i -g fkill-cli

echo "Installing Alfred dark mode"
npm i -g alfred-dark-mode
echo "Installing Alfred fkill"
npm i -g alfred-fkill
echo "Installing Alfred hl"
npm i -g alfred-hl

echo "Installing vmd (view markdown)"
npm install -g vmd

echo "Installing select-branch"
npm install -g select-branch
