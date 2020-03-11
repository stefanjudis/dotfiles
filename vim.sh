#!/usr/bin/env sh
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo ""
echo "#############################"
echo "# Running Vim setup from vim.sh"
echo "#############################"
echo ""

echo $'linking vim configs'

### linking ~/.vimrc
if [ -f ~/.vimrc ]; then
  echo "found old ~/.vimrc - removing..."
  rm ~/.vimrc
fi

echo "Sym linking .vimrc"
ln -s ~/Projects/VimBox/dotVimRc ~/.vimrc


### linking ~/.vim
if [ -f ~/.vim ]; then
  echo "found old ~/.vim - removing..."
  rm -rf ~/.vim
fi

echo "Sym linking .vim"
ln -s ~/Projects/VimBox/dotVim ~/.vim


### linking ~/.gvimrc
if [ -f ~/.gvimrc ]; then
  echo "found old ~/.gvimrc - removing..."
  rm ~/.gvimrc
fi

echo "Sym linking .gvimrc"
ln -s ~/Projects/VimBox/dotGVimRc ~/.gvimrc

if [ -f ~/.vim/vimrc.custom.after ]; then
 rm ~/.vim/vimrc.custom.after
fi

ln -s $DIR/.vim/vimrc.custom.after ~/.vim/vimrc.custom.after

