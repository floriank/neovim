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
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'szw/vim-tags'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

syntax on
set hidden
let g:solarized_termcolors=256

set background=light
colorscheme solarized

if &term =~ '256color'
	" Disable Background Color Erase (BCE) so that color schemes
	" work properly when Vim is used inside tmux and GNU screen.
	" See also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

set tabstop=2
set shiftwidth=2
set noexpandtab
