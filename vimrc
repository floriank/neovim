"Neobundle Setup
if has('vim_starting')
	set nocompatible               " Be iMproved
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tpope/vim-rails'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'outsmartin/haproxy.vim'

if filereadable("mybundles")
  source mybundles
endif

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

syntax on
set hidden
let g:solarized_termcolors=256

set background=dark
colorscheme solarized

if &term =~ '256color'
	" Disable Background Color Erase (BCE) so that color schemes
	" work properly when Vim is used inside tmux and GNU screen.
	" See also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

" Tab and spaces settings
set expandtab     "convert tabs to spaces
set shiftwidth=2  "length for indentation
set tabstop=2     "length for tabs
set smarttab      "enable smart indetation
set autoindent    "enable auto indentation

" Search settings

set hls!
set laststatus=2
set backspace=indent,eol,start    " make backspace behave normally

set tags+=gems.tags
if filereadable("myvimrc")
  source myvimrc
endif
