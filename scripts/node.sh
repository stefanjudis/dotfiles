#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Running global npm setup from npm.sh"
echo "#############################"
echo ""

ROOT_DIR=$1
CONFIG_DIR="$ROOT_DIR/config"

# *************************************
# node
#

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

LATEST_NVM_TAG=$(get_latest_release "nvm-sh/nvm")

echo "installing node via nvm ($LATEST_NVM_TAG)"
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$LATEST_NVM_TAG/install.sh" | bash
printf "installed nvm\n"

# loading nvm for now
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if [ -L "$NVM_DIR/default-packages" ]; then
  echo "found nvm default-packages - removing..."
  rm "$NVM_DIR/default-packages"
fi

echo "linking $NVM_DIR/default-packages"
ln -s "$CONFIG_DIR/package-lists/nvm-default-packages.txt" "$NVM_DIR/default-packages"

nvm install stable
nvm alias default stable
nvm use stable

printf "updating npm\n"
npm i -g npm
