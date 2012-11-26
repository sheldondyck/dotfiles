call pathogen#infect()

set nocompatible
set nocp
syntax enable
syntax on
set encoding=utf-8
set showcmd " display incomplete commands
set relativenumber
filetype plugin indent on " load file type plugins + indentation

" gui
set go-=T
set go-=m
set ruler
set rnu!
colorscheme dusk

"" Whitespace
set nowrap " don't wrap lines
set tabstop=2
set shiftwidth=2
set expandtab " use spaces, not tabs
set backspace=indent,eol,start " backspace through everything in insert mode "" Searching
set bs=indent,eol,start
set hlsearch " highlight matches
set incsearch " incremental searching
set ignorecase " searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter
set hls is ic scs

set backup
set backupdir=~/.vim/bkup
set directory=~/.vim/tmp

" maps
map <F4> :execute "vimgrep /" . expand("<cword>") . "/gj **/*.rb **/*.js **/*.coffee **/*.scss" <Bar> cw<CR>
map <S-F4>   :execute "vimgrep /" . expand("<cword>") . "/gj **" <Bar> (expand("%:e")=="" ? "" : ".".expand("%:e")) <Bar> cw<CR>
map <F8> :cn<CR>
map <S-F8> :cp<CR>

" auto reload config
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
