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

" For lua language server
Plug 'tjdevries/nlua.nvim'

" Debugging
" Plug 'puremourning/vimspector'
" Plug 'szw/vim-maximizer'

" Better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Mappings for commenting code
Plug 'preservim/nerdcommenter'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Telescope fuzzy finder
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
Plug 'norcalli/nvim-colorizer.lua'

" Temporary commented out
"Plug 'sheerun/vim-polyglot'

"Plug 'nvim-lua/popup.nvim'
"Plug 'ray-x/lsp_signature.nvim'

call plug#end()


let g:indentLine_showFirstIndentLevel = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


let g:mapleader = ' '

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
nnoremap <leader>bn :bNext<CR>
nnoremap <leader>bd :bdelete<CR>

map <C-_> <Plug>NERDCommenterToggle


" Debugging
function GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfunction

nnoremap <leader>m :MaximizerToggle!<CR>

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dr :call vimspector#Reset()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>dj :call vimspector#StepOver()<CR>
nnoremap <leader>dl :call vimspector#StepInto()<CR>
nnoremap <leader>dk :call vimspector#StepOut()<CR>
nnoremap <leader>d<space> :call vimspector#Continue()<CR>
nnoremap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dbp :call vimspector#ToggleBreakpoint()<CR>
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint


augroup GEOCHIP
    autocmd!
    autocmd TextYankPost * lua vim.highlight.on_yank({ on_visual = false })
augroup END


source $HOME/.config/nvim/plugin/sets.vim
lua require('geochip')

