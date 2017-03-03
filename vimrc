set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'pangloss/vim-javascript'
    Plugin 'scrooloose/syntastic'
    Plugin 'Raimondi/delimitMate'
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'Yggdroot/indentLine'
call vundle#end()

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab
set list
lcs=eol:¶,tab:»»,trail:·,extends:>,precedes:<

set nu!
set relativenumber
set cursorline

" Fancy search adjustments
set ignorecase
set smartcase
set incsearch
set hlsearch

" Syntax
syntax on

filetype plugin indent on

set t_Co=256

colorscheme solarized
set background=dark

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
