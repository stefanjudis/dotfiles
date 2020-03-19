# get current location
ROOT_DIR=$1
CONFIG_DIR="$ROOT_DIR/config"
SCRIPTS_DIR="$ROOT_DIR/scripts"

echo "running commands/install.sh"

# **********************************
# GIT
#

# remove ~/.gitconfig
if [ -L ~/.gitconfig ]; then
  echo "found old ~/.gitconfig - removing..."
  rm ~/.gitconfig
fi

# link ~/.gitconfig
echo "sym linking new ~/.gitconfig with $CONFIG_DIR/.gitconfig!\n"
ln -s $CONFIG_DIR/.gitconfig ~/.gitconfig

# *********************************
# zsh
#
if [ -L ~/.zshrc ]; then
  echo "found .zshrc - removing..."
  rm ~/.zshrc
fi

echo $'linking .zshrc\n'
ln -s $CONFIG_DIR/.zshrc ~/.zshrc

# *************************************
# oh-my-zsh
#

###
echo $'installing zsh-syntax-highlighting'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

###
echo $'installing zsh-autosuggestions'
git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

if [ -L ~/.oh-my-zsh/custom/stefanjudis.zsh-theme ]; then
  echo "found old stefanjudis.zsh-theme - removing..."
  rm ~/.oh-my-zsh/custom/stefanjudis.zsh-theme
fi

###
echo $'linking stefanjudis zsh-theme\n'
ln -s $CONFIG_DIR/stefanjudis.zsh-theme ~/.oh-my-zsh/custom/stefanjudis.zsh-theme

###
if [ -L ~/.oh-my-zsh/custom/aliases.zsh ]; then
  echo "found old aliases.zsh - removing..."
  rm ~/.oh-my-zsh/custom/aliases.zsh
fi

echo $'linking aliases.zsh\n'
ln -s $CONFIG_DIR/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

###
if [ -L ~/.oh-my-zsh/custom/functions.zsh ]; then
  echo "found old functions.zsh - removing..."
  rm ~/.oh-my-zsh/custom/functions.zsh
fi

###
echo $'linking functions.zsh\n'
ln -s $CONFIG_DIR/functions.zsh ~/.oh-my-zsh/custom/functions.zsh

# *************************************
# npm
#
if [ -L ~/.npmrc ]; then
  echo "found old .npmrc - removing..."
  rm ~/.npmrc
fi

echo $'linking .npmrc\n'
ln -s $CONFIG_DIR/.npmrc ~/.npmrc

# *************************************
# vim
#
if [ -L ~/.vimrc ]; then
  echo "found old .vimrc - removing..."
  rm ~/.vimrc
fi

echo $'linking .vimrc\n'
ln -s $CONFIG_DIR/.vimrc ~/.vimrc

# *************************************
# Other scripts
#
bash $SCRIPTS_DIR/brew.sh $ROOT_DIR
bash $SCRIPTS_DIR/mac.sh $ROOT_DIR
bash $SCRIPTS_DIR/node.sh $ROOT_DIR
bash $SCRIPTS_DIR/cask.sh $ROOT_DIR
bash $SCRIPTS_DIR/code.sh $ROOT_DIR
