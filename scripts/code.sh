#!/usr/bin/env sh

echo "#############################"
echo "# Installing extensions VSCode extensions"
echo "#############################"
echo ""

ROOT_DIR=$1
CONFIG_DIR="$ROOT_DIR/config"

# installing VS Code extensions
# not using cat because of this best practise
# https://github.com/koalaman/shellcheck/wiki/SC2002
< "$CONFIG_DIR/package-lists/visual-studio-code-extensions.txt" xargs -L 1 code --install-extension
