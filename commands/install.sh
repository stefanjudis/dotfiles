#!/usr/bin/env sh

# get current location
ROOT_DIR=$1
CONFIG_DIR="$ROOT_DIR/config"
SCRIPTS_DIR="$ROOT_DIR/scripts"

source "$ROOT_DIR/commands/__util.sh"

echo "Running commands/install.sh..."

# **********************************
# link private keys
#
FROM_FILES="$ROOT_DIR/.my-config.sh"
TARGET_DIR=~
symlink_files "$FROM_FILES" "$TARGET_DIR"

# **********************************
# root config files (.gitconfig, .npmrc, ...)
#

FROM_FILES="$CONFIG_DIR/home/.*"
TARGET_DIR=~
log_section_start "Sym linking files from $FROM_FILES to $TARGET_DIR"

symlink_files "$FROM_FILES" "$TARGET_DIR"



# **********************************
# iTerm stuff
#

log_section_start "Installing iTerm2 shell integration for fancy menubar"
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

# *************************************
# executables
#

FROM_DIR="$CONFIG_DIR/.bin"
TARGET_DIR=~/.bin
log_section_start "Sym linking $FROM_DIR to $TARGET_DIR"

symlink "$FROM_DIR" "$TARGET_DIR"

# *************************************
# oh-my-zsh
#

log_section_start "Installing oh-my-zsh"

if [ -d ~/.oh-my-zsh/ ]; then
  echo "Cleaning up ~/.oh-my-zsh/"
  rm -rf ~/.oh-my-zsh/
fi

RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing zsh-autosuggestions"
git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# *************************************
# oh-my-zsh config files
#

FROM_FILES="$CONFIG_DIR/oh-my-zsh/*"
TARGET_DIR=~/.oh-my-zsh/custom/
log_section_start "Sym linking files from $FROM_FILES to $TARGET_DIR"
symlink_files "$FROM_FILES" "$TARGET_DIR"

# *************************************
# Other scripts

bash "$SCRIPTS_DIR/brew.sh" "$ROOT_DIR"
bash "$SCRIPTS_DIR/mac.sh" "$ROOT_DIR"
bash "$SCRIPTS_DIR/node.sh" "$ROOT_DIR"
bash "$SCRIPTS_DIR/cask.sh" "$ROOT_DIR"
bash "$SCRIPTS_DIR/code.sh" "$ROOT_DIR"
bash "$SCRIPTS_DIR/go.sh" "$ROOT_DIR"
