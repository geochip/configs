vim.api.nvim_set_keymap('n', '<leader>d', [["ayiW:execute '!rpm --eval ' . escape(@a, '%')<CR>]], { noremap = true })
