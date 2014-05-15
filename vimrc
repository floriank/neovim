" ----------------------------------------------------------------------------
" Neobundle Setup
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

if has('vim_starting')
	set nocompatible               " Be iMproved
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" productivity stuff
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'rking/ag.vim'
NeoBundle 'flazz/vim-colorschemes' "all colorschemes there are

" language support stuff
NeoBundle 'tpope/vim-rails'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'outsmartin/haproxy.vim'

if filereadable(expand("~/.vim/mybundles"))
  source ~/.vim/mybundles
endif

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

" ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
" Neobundle END
" ----------------------------------------------------------------------------

syntax on
set hidden
set encoding=utf-8
let mapleader = ","

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

" ----------------------------------------------------------------------------
"  moving around, searching and patterns
" ----------------------------------------------------------------------------
set hls!            " highlight all matches
set nostartofline   " keep cursor in same column for long-range motion cmds
set incsearch       " Highlight pattern matches as you type
set ignorecase      " ignore case when using a search pattern
set smartcase       " override 'ignorecase' when pattern
                    " has upper case character
set scrolloff=5

set laststatus=2
set backspace=indent,eol,start    " make backspace behave normally
set ttyfast " faster vim on fast connections
set ruler

autocmd BufWritePre * :%s/\s\+$//e
highlight ExtraWhitespace ctermbg=darkblue guibg=darkblue
match ExtraWhitespace /\s\+$/

set wildmode=list:longest,full

" CtrlP stuff
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" File tab completion ignores these file patterns
set wildignore+=*.exe,*.swp,.DS_Store,*~,*.o
set wildmenu

set noswapfile

" ,rt -> regenerate ctags with gemdir and code
map <leader>rt :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR><C-M>

if filereadable(expand("~/.vim/myvimrc"))
  source ~/.vim/myvimrc
endif
