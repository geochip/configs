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

vim.g.airline_powerline_fonts = 1


-- COLORSCHEME SETUP
vim.o.background = 'dark'
vim.o.termguicolors = true

vim.cmd('colorscheme catppuccin-mocha')

-- Diagnostics
vim.cmd('highlight LspDiagnosticsDefaultError guifg=red gui=bold')
vim.cmd('highlight LspDiagnosticsDefaultWarning guifg=orange gui=bold')
vim.cmd('highlight LspDiagnosticsDefaultInformation guifg=yellow gui=bold')
vim.cmd('highlight LspDiagnosticsDefaultHint guifg=green gui=bold')

-- KEYMAPPINGS
vim.api.nvim_set_keymap('n', '<leader>u', ':nohlsearch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rt', [[mz:%s/ \+$//g<CR>`z]], { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>+', ':vertical resize +5<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>-', ':vertical resize -5<CR>', { noremap = true })

vim.api.nvim_set_keymap('v', 'J', [[:m '>+1<CR>gv=gv]], { noremap = true })
vim.api.nvim_set_keymap('v', 'K', [[:m '<-2<CR>gv=gv]], { noremap = true })

vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>f', ':lua vim.diagnostic.open_float({border="rounded"})<CR>', { noremap = true })

-- Buffers
vim.api.nvim_set_keymap('n', '<C-n>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':bprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-d>', ':bdelete<CR>', { noremap = true })

-- Obsidian
vim.api.nvim_set_keymap('n', '<leader>oq', ':ObsidianQuickSwitch<CR>', { noremap = true })

-- NERDCommenter
vim.api.nvim_set_keymap('n', '<C-_>', '<Plug>NERDCommenterToggle', { noremap = true })
vim.api.nvim_set_keymap('x', '<C-_>', '<Plug>NERDCommenterToggle', { noremap = true })

-- Netrw
vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', { noremap = true })


-- Python formatting
vim.api.nvim_set_keymap('n', '<leader>b', ':!black -q -l 79 %<CR>', { noremap = true })

-- Neogit
vim.api.nvim_set_keymap('n', '<leader>n', ':Neogit<CR>', { noremap = true })

-- C++
vim.api.nvim_set_keymap('n', '<leader>k', ':!./build.sh<CR>', { noremap = true })

-- AUTOCOMMANDS
vim.cmd([[
    augroup GEOCHIP
        autocmd!
        autocmd BufWritePre * %s/\s\+$//e
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
        autocmd TextYankPost * lua vim.highlight.on_yank({ on_visual = false })
    augroup END
]])


-- PLUGINS CONFIGS
require('geochip')
