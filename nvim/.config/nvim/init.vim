"{{{---Vundle configuration---}}}
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Keep Plugin commands between vundle#begin/end.
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'elzr/vim-json'
"Plugin 'bogado/file-line' breaks tar.gz opening
Plugin 'tpope/vim-repeat'
Plugin 'simplyzhao/cscope_maps.vim'
Plugin 'sgeb/vim-diff-fold'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'junegunn/fzf'
Plugin 'dhruvasagar/vim-zoom'
Plugin 'preservim/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"{{{---Airline configuration---}}}
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='jellybeans'

"{{{---General configuration---}}}
colorscheme jellybeans
set scrolloff=10
set number
set relativenumber

set t_Co=256
set cscopetag
set incsearch
"set hidden

set shiftwidth=8
set tabstop=8
set noexpandtab
set softtabstop=0

" highlight tabs and trailing spaces
set list

map <F2> :bprevious<CR>
map <F3> :bnext<CR>

"rebind my favorite commands from Git.vim for Fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gb :Gblame<cr>

"Spell checking
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

"Auto completion
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell

"Manual spell enable/disable
nnoremap <F9> :setlocal spell!<cr>
