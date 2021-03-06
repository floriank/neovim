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
NeoBundle 'Lokaltog/powerline'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'flazz/vim-colorschemes' "all colorschemes there are
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'benekastah/neomake'

" language support stuff
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'outsmartin/haproxy.vim'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'wting/rust.vim'
NeoBundle 'benekastah/neomake'
NeoBundle 'tpope/vim-projectionist'

if filereadable(expand("$XDG_CONFIG_HOME/nvim/users/$USER/mybundles"))
  source $XDG_CONFIG_HOME/users/$USER/mybundles
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

set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
" set guifont=Ubuntu\ Mono
let g:Powerline_symbols = 'fancy'

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
autocmd! BufWritePost * Neomake
set clipboard+=unnamedplus
highlight ExtraWhitespace ctermbg=darkblue guibg=darkblue
match ExtraWhitespace /\s\+$/

set wildmode=list:longest,full

" CtrlP stuff
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" File tab completion ignores these file patterns
set wildignore+=*.exe,*.swp,.DS_Store,*~,*.o
set wildmenu
map <leader>b :CtrlPBuffer<RETURN>
map <C-b> :CtrlPBuffer<RETURN>

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ,rt -> regenerate ctags with gemdir and code
map <leader>rt :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR><C-M>

autocmd! BufWritePost * Neomake
map <leader>n :NERDTreeToggle<RETURN>

if filereadable(expand("$XDG_CONFIG_HOME/nvim/users/$USER/myvimrc"))
  source $XDG_CONFIG_HOME/nvim/users/$USER/myvimrc
endif
