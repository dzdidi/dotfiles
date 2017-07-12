set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'pangloss/vim-javascript'
    Plugin 'scrooloose/syntastic'
    Plugin 'Raimondi/delimitMate'
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Yggdroot/indentLine'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'nerdtree'
call vundle#end()

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab
set list
lcs=eol:¶,tab:»»,trail:·,extends:>,precedes:<

" Adjust view for navigation
set number
set relativenumber
set cursorline

" Fancy search adjustments
set ignorecase
set smartcase
set incsearch
set hlsearch

" Syntax
syntax on

" Status line
set showcmd
set laststatus=2

filetype plugin indent on

" Set colors and theme
set t_Co=256
colorscheme solarized
set background=light

" Proper tab spliting
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" NerdTree start up and shut down
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Map it
map <C-n> :NERDTreeToggle<CR>
" show hidden files
let NERDTreeShowHidden=1 "Can be done by <Shift+I>

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append
" `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append
" `!` to refresh local cache
" :PluginClean      - confirms removal of unused
" plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
