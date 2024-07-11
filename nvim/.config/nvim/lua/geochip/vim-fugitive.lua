vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gvdiffsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gt', ':Gvdiffsplit!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gll', ':tab Git log --decorate --graph<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gl<space>', ':tab Git log --decorate --graph ', { noremap = true })

