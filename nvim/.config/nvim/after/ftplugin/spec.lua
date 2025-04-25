vim.api.nvim_set_keymap('n', '<leader>d', [["ayiW:execute '!rpm --eval ' . escape(@a, '%')<CR>]], { noremap = true })
vim.api.nvim_set_keymap('x', '<leader>d', [["ay:execute '!rpm --eval ''' . trim(escape(@a, '%')) . ''''<CR>]], { noremap = true })
