call plug#begin('~/.vim/plugged')

" Debugging
" Plug 'puremourning/vimspector'
" Plug 'szw/vim-maximizer'

" Mappings for commenting code
Plug 'preservim/nerdcommenter'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Telescope fuzzy finder
Plug 'junegunn/fzf'

" UI stuff
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'

" Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'

Plug 'sheerun/vim-polyglot'

call plug#end()


let g:indentLine_showFirstIndentLevel = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


let g:mapleader = ' '

syntax enable
filetype plugin indent on

packadd termdebug

set completeopt=menuone,noselect

colorscheme gruvbox

set background=dark
set termguicolors

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" set statusline=%f\ %=Line\ %l/%L\ Col\ %c\ (%p%%)
set number
set relativenumber
set hlsearch
set incsearch
set cursorline
set hidden
set guicursor=
set scrolloff=8
set cmdheight=2
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set list
set listchars=trail:·,tab:»·,extends:>,precedes:<
set signcolumn=yes


nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :nohlsearch<CR>

nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Buffers
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

map <C-_> <Plug>NERDCommenterToggle


nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z


" fzf fuzzy finder
nnoremap <leader>pf :call fzf#run({'options': "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"})<CR>

