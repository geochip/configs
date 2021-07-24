local indent = 4

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.o.hidden = true
vim.o.scrolloff = 8
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.shiftround = true

vim.bo.expandtab = true
vim.bo.smartindent = true
vim.bo.shiftwidth = indent
vim.bo.tabstop = indent
vim.bo.softtabstop = indent

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

vim.cmd([[
    augroup MY_GROUP
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
        autocmd TextYankPost * lua vim.highlight.on_yank({ on_visual = false })
    augroup END
]])

