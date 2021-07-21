call plug#begin('~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdcommenter'
Plug 'windwp/nvim-autopairs'

Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'

call plug#end()

let g:mapleader=' '

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>u :nohlsearch<CR>

map <C-_> <Plug>NERDCommenterToggle

