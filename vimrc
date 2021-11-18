set nocompatible              " be iMproved, required
filetype off                  " required
" PlugInstall [name ...] [#threads]	Install plugins
" PlugUpdate [name ...] [#threads]	Install or update plugins
" PlugClean[!]	Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade	Upgrade vim-plug itself
" PlugStatus	Check the status of plugins
" PlugDiff	Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]	Generate script for restoring the current snapshot of the plugins

call plug#begin()
    Plug 'jelera/vim-javascript-syntax'
    Plug 'leafgarland/typescript-vim'
    Plug 'Quramy/tsuquyomi'
    Plug 'scrooloose/syntastic'
    Plug 'tpope/vim-fugitive'
    Plug 'Raimondi/delimitMate'
    Plug 'VundleVim/Vundle.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'othree/yajs.vim'
    Plug 'ericpruitt/tmux.vim', {'rtp': 'vim/'}
    Plug 'fatih/vim-go'
    Plug 'iCyMind/NeoSolarized'
    Plug 'romainl/flattened'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tomlion/vim-solidity'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'micha/vim-colors-solarized'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" convert tabs to spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
set smarttab
set et

" always set autoindenting on
set smartindent

" auto reload file on change
set autoread

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
set colorcolumn=81
:highlight ColorColumn ctermbg=lightblue guibg=lightblue
"
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
set display-=msgsep

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.dSYM                           " OSX debug info directories
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code

" When vimrc is edited, reload it
autocmd! bufwritepost nvimrc source ~/.nvimrc

" Set colors and theme
"colorscheme NeoSolarized
colorscheme solarized
set background=dark
let g:solarized_termcolors=16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
"set t_Co=256

" Nonrmal mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Proper tab spliting
set splitbelow
set splitright
" 
nnoremap <C-W><C-F> <C-W>vgf

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

autocmd FileType typescript :set makeprg=tsc
