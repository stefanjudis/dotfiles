" ***********************************
" VUNDLE SETINGS
"
set nocompatible             " required
filetype off                 " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'unite.vim'
Bundle 'scrooloose/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required


" ***********************************
" GENERAL SETTINGS
"

" tab size 2
set tabstop=2

" make tabs to spaces
set expandtab

" change map leader from \ to ,
let mapleader=","

" set a fancy status line
set ls=2
set statusline=%F%m%r%h%w\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" set line numbers
set number
" enable syntax highlighting
syntax on
" set jj to be ESC
imap jj <Esc>

" whitespace settings
set listchars=tab:>-,trail:!
set list
highlight SpecialKey ctermfg=1



" ***********************************
" UNITE SETTINGS
"

" Set unite window height
let g:unite_winheight = 10

" Start unite in insert mode by default
let g:unite_enable_start_insert = 1

" Fuzzy find files
" TODO make this work

" fuzzy search
nnoremap <silent><leader>p :Unite file_rec<CR>
