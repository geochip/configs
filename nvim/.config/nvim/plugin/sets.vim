syntax enable
filetype plugin indent on

packadd termdebug

set completeopt=menuone,noselect

let ayucolor="mirage"
colorscheme ayu
set background=dark
set termguicolors
highlight Normal guibg=None

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

