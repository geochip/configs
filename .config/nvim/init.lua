local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_command('packadd packer.nvim')
end

vim.g.mapleader = ' '

-- Sensible defaults
require('settings')

require('keymappings')

require('colorscheme')

require('plugins')

require('lsp')

require('config')

vim.api.nvim_set_keymap('', '<C-_>', '<Plug>NERDCommenterToggle', {})

