" Use Vim settings rather than Vi settings
"
" Explicitly setting this is helpful when using the -u option.
" Should be first line in vimrc.
set nocompatible

colorscheme Tomorrow-Night

" Create alternate mapping for exiting insert mode
inoremap jk <Esc>

" Set custom <Leader> key
let mapleader = "\<Space>"

" Enable line numbers
set number
set relativenumber

" Set tabs to two spaces by default
set expandtab
set softtabstop=2
set shiftwidth=2

" Enable automatic file-type based indentation
filetype plugin indent on

" Set color map for syntax highlighting
set background=dark

syntax enable
set encoding=utf-8

" Enable spellchecking
set spell spelllang=en_us
set spellcapcheck=""

" Compile and create spell file if it does not exist or is not readable
if !filereadable(expand("~/.vim/spell/en.utf-8.add.spl"))
  mkspell! ~/.vim/spell/en.utf-8.add
endif

" Map dot to work the same in visual mode as it does in normal mode
vnoremap . :normal.<CR>

" Make backspace more effective
set backspace=indent,eol,start

" Set scroll margin for window top and bottom
set scrolloff=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Source and execute Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Toggle Goyo
nnoremap <silent> <Leader>g :Goyo<CR>

" Toggle Limelight
nnoremap <silent> <Leader>l :Limelight!!<CR>

" Toggle Goyo and Limelight
nnoremap <silent> <Leader>gl :Goyo<CR>:Limelight!!<CR>

" Make airline statusline always visible
set laststatus=2
