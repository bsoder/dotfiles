" .vimrc by bsoder

set nocompatible
filetype indent plugin on
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set ruler
set laststatus=2
set backspace=indent,eol,start
set confirm
set visualbell
set t_vb=
set cmdheight=2
set number
nnoremap <C-L> :nohl<CR><C-L>
set clipboard=unnamed
colorscheme delek
execute pathogen#infect()
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
