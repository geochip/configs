" Download vim-plug for neovim:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
"" Plugins
"" Specify a directory for plugins
"" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'danilo-augusto/vim-afterglow'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'

call plug#end()


let g:afterglow_inherit_background=1


syntax enable
"" 24-bit colours please
set termguicolors
colorscheme afterglow
set background=dark
set showmatch


"" Show status line
set laststatus=2
"" Customise our current location information
"" set statusline=%f\ %=Line\ %l/%L\ Col\ %c\ (%p%%)
"" Absolute numbers on the current line
set number
"" Relative line numbers
set relativenumber
"" Highlight current line
set cursorline
"" Show invisibles
set list
set listchars=trail:·,tab:»·,extends:>,precedes:<


"" 4 spaces insted of Tab
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
"" Show file title in terminal tab
set title
"" Keep more lines above the cursor
set scrolloff=8
"" Give more space for displaying messages.
set cmdheight=2
"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"" delays and poor user experience.
set updatetime=2000
""  When lines longer than the width of the window
""  will not wrap and displaying continues on the next line
set nowrap
"" Don't create swap files
set noswapfile
"" Specify undo directory...
set undodir=~/.config/nvim/undodir
"" ...use per every single file
set undofile


"" Keep results highlighted after searching...
set hlsearch
"" ...and highlight as we type
set incsearch



"" Comma is a leader-key now
let g:mapleader=','

"" For easy motions among windows
noremap <C-l> :wincmd l<CR>
noremap <C-h> :wincmd h<CR>
noremap <C-j> :wincmd j<CR>
noremap <C-k> :wincmd k<CR>

"" Quick save and quit
nnoremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>

"" Hide highlighted results after searching
noremap <Leader>u :nohlsearch<CR>


"" NERDTree
map <C-n> :NERDTreeToggle<CR>

