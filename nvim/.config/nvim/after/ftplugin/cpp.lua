local indent = 4
vim.bo.tabstop = indent
vim.bo.softtabstop = indent
vim.bo.shiftwidth = indent
vim.bo.expandtab = true
vim.bo.cinoptions = 'l1'

vim.opt.formatoptions:remove({'r', 'o'})

vim.bo.makeprg = './nob'
vim.api.nvim_set_keymap('n', '<leader>k', ':make<CR>', { noremap = true })
