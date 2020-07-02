#!/usr/bin/env sh

# get current location
ROOT_DIR=$1
CONFIG_DIR="$ROOT_DIR/config"

echo "running commands/backup.sh"

# backing up VS Code extensions
code --list-extensions > "$CONFIG_DIR/package-lists/visual-studio-code-extensions.txt"

# backing up global npm modules
npm ls -g --depth=0 --parseable | grep -o 'node_modules/.*$' | sed 's:node_modules/::g' > "$CONFIG_DIR/package/lists/nvm-default-packages.txt"

