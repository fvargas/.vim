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

" Configure spellchecking
set spelllang=en_us
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

" Create mappings for splitting a new window with a specified file
nnoremap <C-j> :split<Space>
nnoremap <C-l> :vsplit<Space>

" Set the location for a new split window relative to its parent
set splitbelow
set splitright

" Remove separator character between vertical split windows
set fillchars-=vert:\|

" Make separator background between vertical split windows transparent
highlight VertSplit ctermbg=none

" Create mappings for changing focus between windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Highlight the 81st virtual column of a line when it exceeds 80 characters
function HighlightColumn()
  if !exists("w:highlightcolumn")
    let w:highlightcolumn = 1
    call matchadd("ColorColumn", '\%81v\S', 20)
  endif
endfunction
autocmd VimEnter,WinEnter * call HighlightColumn()
highlight ColorColumn ctermbg=magenta

" Create mappings for writing and quitting
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>a :qa<CR>
nnoremap <Leader>x :x<CR>

" Make the status line always visible
set laststatus=2

" Show line and column number of cursor and relative positon of text
set ruler

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
nnoremap <silent> <Leader>i :Limelight!!<CR>

" Toggle Goyo and Limelight
nnoremap <silent> <Leader>gi :Goyo<CR>:Limelight!!<CR>

" Toggle NERDTree
nnoremap <Leader>t :NERDTreeToggle<CR>
