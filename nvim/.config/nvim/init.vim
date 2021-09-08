call plug#begin('~/.vim/plugged')

" LSP and completion stuff
Plug 'neovim/nvim-lspconfig'
Plug 'windwp/nvim-autopairs'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/nvim-cmp'

Plug 'tjdevries/nlua.nvim'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" Mappings for commenting code
Plug 'preservim/nerdcommenter'

" Telescope fuzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" UI stuff
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Temporary commented out
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/playground'

"Plug 'tpope/vim-fugitive'
"Plug 'puremourning/vimspector'

"Plug 'nvim-lua/popup.nvim'
"Plug 'ray-x/lsp_signature.nvim'

call plug#end()


let g:indentLine_showFirstIndentLevel = 1
let g:airline_powerline_fonts = 1

"let g:vimspector_enable_mappings = 'HUMAN'


let g:mapleader = ' '

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>u :nohlsearch<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>bn :bNext<CR>
nnoremap <leader>bd :bdelete<CR>

map <C-_> <Plug>NERDCommenterToggle

augroup GEOCHIP
    autocmd!
    autocmd TextYankPost * lua vim.highlight.on_yank({ on_visual = false })
augroup END


lua require('geochip')

