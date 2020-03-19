#!/usr/bin/env sh

ROOT_DIR=$1
CONFIG_DIR="$ROOT_DIR/config"

# installing VS Code extensions
# not using cat because of this best practise
# https://github.com/koalaman/shellcheck/wiki/SC2002
< "$CONFIG_DIR/visual-studio-code-extensions.txt" xargs -L 1 code --install-extension
