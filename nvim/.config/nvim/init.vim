"{{{---Vundle configuration---}}}
set nocompatible              " be iMproved, required
filetype off                  " required

"{{{---Vim Plug Autoinstall---}}}
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" The default plugin directory will be as follows:
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
"Plug 'edkolev/tmuxline.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree'
Plug 'rking/ag.vim'
Plug 'elzr/vim-json'
"Plug 'bogado/file-line' breaks tar.gz opening
Plug 'tpope/vim-repeat'
Plug 'sgeb/vim-diff-fold'
Plug 'vim-scripts/BufOnly.vim'
Plug 'junegunn/fzf'
Plug 'dhruvasagar/vim-zoom'
Plug 'preservim/tagbar'
"Plug 'dhruvasagar/vim-table-mode'
Plug 'dhananjaylatkar/cscope_maps.nvim'
Plug 'folke/which-key.nvim'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

lua require("cscope_maps").setup({})

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
let g:airline_extensions = ['tabline']
"let g:airline_extensions = []
"let g:airline_highlighting_cache = 1

"{{{---General configuration---}}}
colorscheme jellybeans
set scrolloff=10
set number
set relativenumber

set t_Co=256
set incsearch
"set hidden

set shiftwidth=8
set tabstop=8
set noexpandtab
set softtabstop=0

" highlight tabs and trailing spaces
set list

" disable mouse
set mouse=

map <F2> :bprevious<CR>
map <F3> :bnext<CR>
map <F4> :NERDTreeToggle<CR>

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
