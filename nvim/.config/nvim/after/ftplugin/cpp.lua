local indent = 8
vim.bo.tabstop = indent
vim.bo.softtabstop = indent
vim.bo.shiftwidth = indent
vim.bo.expandtab = false
vim.bo.cinoptions = 'l1'

vim.opt.formatoptions:remove({'r', 'o'})

vim.bo.makeprg = './build.sh'
vim.api.nvim_set_keymap('n', '<leader>k', ':make<CR>', { noremap = true })
