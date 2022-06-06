" ███╗   ██╗███████╗██╗  ██╗███╗   ██╗
" ████╗  ██║██╔════╝╚██╗██╔╝████╗  ██║
" ██╔██╗ ██║█████╗   ╚███╔╝ ██╔██╗ ██║
" ██║╚██╗██║██╔══╝   ██╔██╗ ██║╚██╗██║
" ██║ ╚████║███████╗██╔╝ ██╗██║ ╚████║
" ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝
"
" Twitter : https://twitter.com/itsnexn
" Github  : https://github.com/Itsnexn
" Website : Itsnexn.me
"
" MIT License

set directory=$XDG_CACHE_HOME/vim,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME

set path+=**/*

silent autocmd Filetype html setlocal ts=2 sw=2
silent autocmd Filetype makefile setlocal  ts=8  sw=8

set clipboard="unnamedplus"
set mouse=a
set shortmess=at
set laststatus=2
set number
set relativenumber
set numberwidth=3
set scrolloff=6
set shiftwidth=4
set tabstop=4
set smartindent
set smartcase
set hidden
set hlsearch
set ignorecase
set wildmenu
set wildmode="full"
set pumheight=15
set splitbelow
set splitright
