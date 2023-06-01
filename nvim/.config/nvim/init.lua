-- PLUGINS SETUP
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_command('packadd packer.nvim')
end

require('plugins')

require('sets')

-- GLOBAL VARIABLES
vim.g.mapleader = ' '

vim.g.indentLine_showFirstIndentLevel = 1
vim.g.airline_powerline_fonts = 1
vim.g['airline#extensions#tabline#enabled'] = 1


-- COLORSCHEME SETUP
-- vim.g.ayucolor = 'mirage'
vim.cmd('colorscheme gruvbox')
vim.o.background = 'dark'
vim.o.termguicolors = true

vim.cmd('highlight Normal guibg=None')

vim.cmd('highlight LspDiagnosticsDefaultError guifg=red gui=bold')
vim.cmd('highlight LspDiagnosticsDefaultWarning guifg=orange gui=bold')
vim.cmd('highlight LspDiagnosticsDefaultInformation guifg=yellow gui=bold')
vim.cmd('highlight LspDiagnosticsDefaultHint guifg=green gui=bold')


-- KEYMAPPINGS
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>u', ':nohlsearch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rt', [[mz:%s/ \+$//g<CR>`z]], { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>+', ':vertical resize +5<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>-', ':vertical resize -5<CR>', { noremap = true })

vim.api.nvim_set_keymap('v', 'J', [[:m '>+1<CR>gv=gv]], { noremap = true })
vim.api.nvim_set_keymap('v', 'K', [[:m '<-2<CR>gv=gv]], { noremap = true })

vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true })

-- Buffers
vim.api.nvim_set_keymap('n', '<C-n>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':bprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-d>', ':bdelete<CR>', { noremap = true })

-- Debugging
vim.api.nvim_set_keymap('n', '<F5>', [[:lua require('dap').continue()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<F2>', [[:lua require('dap').step_into()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<F3>', [[:lua require('dap').step_over()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', [[:lua require('dap').toggle_breakpoint()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>B', [[:lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], { noremap = true })

-- NERDCommenter
vim.api.nvim_set_keymap('n', '<C-_>', '<Plug>NERDCommenterToggle', { noremap = true })
vim.api.nvim_set_keymap('x', '<C-_>', '<Plug>NERDCommenterToggle', { noremap = true })


-- AUTOCOMMANDS
vim.cmd([[
    augroup GEOCHIP
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
        autocmd TextYankPost * lua vim.highlight.on_yank({ on_visual = false })
        autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        autocmd FileType htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    augroup END
]])


-- PLUGINS CONFIGS
require('geochip')

