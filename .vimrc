" ***********************************
" VUNDLE SETINGS
"
set nocompatible             " required
filetype off                 " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

call vundle#end()            " required
filetype plugin indent on    " required

" ***********************************
" GENERAL SETTINGS
"

" set line numbers
set number
" enable syntax highlighting
syntax on
" set jj to be ESC 
imap jj <Esc> 
