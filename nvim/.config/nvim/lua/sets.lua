-- SETS
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.cmd('packadd termdebug')

local indent = 4
vim.bo.tabstop = indent
vim.bo.softtabstop = indent
vim.bo.shiftwidth = indent
vim.bo.expandtab = true
vim.bo.autoindent = true

vim.bo.swapfile = false
vim.o.backup = false
vim.bo.undofile = true

-- set statusline=%f\ %=Line\ %l/%L\ Col\ %c\ (%p%%)

vim.o.completeopt = 'menuone,noselect'
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.scrolloff = 8
vim.o.cmdheight = 2
vim.o.listchars = 'trail:·,tab:»·,extends:>,precedes:<'

vim.o.guicursor = nil

vim.wo.colorcolumn = '72'
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.wrap = false
vim.wo.list = true
vim.wo.signcolumn = 'yes'

vim.g.vim_markdown_conceal_code_blocks = 0

