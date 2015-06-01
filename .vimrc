call pathogen#infect()

" basic
behave mswin
set nocompatible
syntax enable
syntax on
set encoding=utf-8
set showcmd " display incomplete commands

filetype plugin indent on " load file type plugins + indentation

" gui
set go-=T
set go-=m
set ruler
set hlsearch " highlight matches
set incsearch " incremental searching
set ignorecase " searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter
set hls is ic scs
set anti " antialias
set rnu " relative line numbers
set laststatus=2
set ofu=syntaxcomplete#Complete " omni complete
if has("gui_macvim")
  set guifont=Inconsolata-dz\ for\ Powerline:h16
else
  set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10
endif
" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
if has('gui_running')
  set background=light
  colorscheme dusk
  set lines=50 columns=120
else
  set background=dark
  "set background=light
  let g:solarized_termcolors = &t_Co
  let g:solarized_termtrans = 1
  colorscheme solarized
endif

"" Whitespace
set nowrap " don't wrap lines
set tabstop=2
set shiftwidth=2
set expandtab " use spaces, not tabs
set bs=indent,eol,start

" backup
set backup
set backupdir=~/.vim/bkup
set directory=~/.vim/tmp

filetype on
filetype indent on
filetype plugin on

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Move between window splits
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" set the 'cpoptions' to its Vim default
if 1  " only do this when compiled with expression evaluation
  let s:save_cpo = &cpoptions
endif
set cpo&vim

" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X>      "+x
vnoremap <S-Del>    "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C>      "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>           "+gP
map <S-Insert>      "+gP
cmap <C-V>          <C-R>+
cmap <S-Insert>     <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert>   <C-V>
vmap <S-Insert>   <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>   <C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>     :update<CR>
vnoremap <C-S>    <C-C>:update<CR>
inoremap <C-S>    <C-O>:update<CR>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z>       u
inoremap <C-Z>      <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
"noremap <C-Y> <C-R>
"inoremap <C-Y> <C-O><C-R>
"let g:user_zen_expandabbr_key = '<C-Y>'
"let g:use_zen_complete_tag = 1

" Alt-Space is System menu
if has("gui")
  noremap <M-Space>   :simalt ~<CR>
  inoremap <M-Space>  <C-O>:simalt ~<CR>
  cnoremap <M-Space>  <C-C>:simalt ~<CR>
endif

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" Option-Tab is Next window
noremap <M-Tab> <C-W>w
inoremap <M-Tab> <C-O><C-W>w
cnoremap <M-Tab> <C-C><C-W>w
onoremap <M-Tab> <C-C><C-W>w

" restore 'cpoptions'
set cpo&
if 1
  let &cpoptions = s:save_cpo
  unlet s:save_cpo
endif

if has("gui_running")
  nnoremap <esc> :noh<return><esc>
endif

" show wildmenu on command line
set wildchar=<Tab> wildmenu wildmode=full

" Removes overwrite register when doing paste
" I haven't found how to hide this function (yet)
"function! RestoreRegister()
  "let @" = s:restore_reg
  "if &clipboard == "unnamed"
    "let @* = s:restore_reg
  "endif
  "return ''
"endfunction
"
"function! s:Repl()
  "let s:restore_reg = @"
  "return
  ""p@=RestoreRegister()\<cr>"
"endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
"vnoremap <silent> <expr> p <sid>Repl()

" maps
map <F2>      :NERDTreeToggle<CR>
map <F4>      :execute "vimgrep /" . expand("<cword>") . "/gj **/*.rb **/*.js **/*.coffee **/*.scss **/*.haml" <Bar> cw<CR>
map <F8>      :cn<CR>
map <S-F8>    :cp<CR>
map <C-TAB>   :bn<CR>
map <C-S-TAB> :bp<CR>

" NERDTree config
let NERDTreeMinimalUI=1

" NERDTree open buffer at same line
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" add vim-css-color support to scss files
autocmd! FileType scss syntax cluster sassCssAttributes add=@cssColors

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
if has('gui_running')
  let g:airline_powerline_fonts = 1
endif

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()"
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" Homemade Statusline. Switched to airline
"function! InsertStatuslineColor(mode)
"  if a:mode == 'i'
"    hi statusline guibg=DarkGreen guifg=White
"  elseif a:mode == 'r'
"    hi statusline guibg=DarkGreen guifg=White
"  else
"    hi statusline guifg=#666666 guibg=#181820
"  endif
"endfunction

"if has("gui_running")
"   TODO: This creates an error in terminal mode. Only using in gui mode for now.
"  au InsertEnter * call InsertStatuslineColor(v:insertmode)
"  au InsertChange * call InsertStatuslineColor(v:insertmode)
"  au InsertLeave * hi statusline guifg=#666666 guibg=#181820
"  " default the statusline to green when entering Vim
"  hi statusline guifg=#666666 guibg=#181820
"else
"  hi statusline ctermbg=235 ctermfg=37
"endif

" auto reload config
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYVIMRC | endif
augroup END

