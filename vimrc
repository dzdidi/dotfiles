set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate (same to remove unlisted)
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
call vundle#begin()
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'leafgarland/typescript-vim'
    Plugin 'scrooloose/syntastic'
    Plugin 'tpope/vim-fugitive'
    Plugin 'Raimondi/delimitMate'
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'ekalinin/Dockerfile.vim'
    Plugin 'Yggdroot/indentLine'
    Plugin 'othree/yajs.vim'
    Plugin 'ericpruitt/tmux.vim', {'rtp': 'vim/'}
    Plugin 'fatih/vim-go'
    Plugin 'iCyMind/NeoSolarized'
    Plugin 'romainl/flattened'
    Plugin 'vim-airline/vim-airline'
call vundle#end()

" convert tabs to spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
set smarttab
set et


" always set autoindenting on
set autoindent
set smartindent

" folding options
set foldmethod=indent
set nofoldenable

" Invisible charaters
set list listchars=tab:»·,trail:·,eol:¶

" Adjust view for navigation
set number
set ruler
set relativenumber

" Highlightning
set cursorline
set cursorcolumn
set colorcolumn=80
:highlight ColorColumn ctermbg=lightblue guibg=lightblue

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" no backups
set nobackup
set nowb
set noswapfile

" Fancy search adjustments
set ignorecase
set smartcase
set incsearch
set hlsearch

" Syntax
filetype off
filetype plugin indent on
syntax on

" UI re-rendering (for ocasional syntax bugs on large files)
set nolazyredraw

" JSON files are javascript
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.m set ft=objc

" Status line
"set showcmd
"set laststatus=2

" enable mouse
set mouse=a

filetype plugin indent on

" command line completion
set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.dSYM                           " OSX debug info directories
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code

" When vimrc is edited, reload it
"autocmd! bufwritepost nvimrc source ~/.nvimrc

" Set colors and theme
colorscheme NeoSolarized
set background=dark
let g:solarized_termcolors=16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
"set t_Co=256
"colorscheme solarized

" Nonrmal mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Proper tab spliting
set splitbelow
set splitright

" Terminal mapping
":tnoremap <Esc> <C-\><C-n>
":tnoremap <C-h> <C-\><C-N><C-w>h
":tnoremap <C-j> <C-\><C-N><C-w>j
":tnoremap <C-k> <C-\><C-N><C-w>k
":tnoremap <C-l> <C-\><C-N><C-w>l

" Unset the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

" NerdTree start up and shut down
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Map it
map <C-n> :NERDTreeToggle<CR>
" show hidden files
let NERDTreeShowHidden=1 "Can be done by <Shift+I>

" Beatufication commands
command Bjson execute "%!python -m json.tool"

" Spell check
set spelllang=en
set spell

" Ctags
set tags=tags
