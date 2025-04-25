local indent = 4
vim.bo.tabstop = indent
vim.bo.softtabstop = indent
vim.bo.shiftwidth = indent
vim.bo.expandtab = false

vim.bo.makeprg = 'go build'
vim.api.nvim_set_keymap('n', '<leader>k', ':make<CR>', { noremap = true })
