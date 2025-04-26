require("telescope").setup({
   defaults = {
      file_sorter = require("telescope.sorters").get_fzy_sorter,
   },
   extentions = {
      fzy_native = {
         override_generic_sorter = false,
         override_file_sorter = true,
      },
   },
})

require("telescope").load_extension("fzy_native")

local M = {}
M.search_dotfiles = function()
   require("telescope.builtin").find_files({
      prompt_title = "< VimRC >",
      cwd = vim.fn.stdpath("config"),
      follow = true,
   })
end

vim.api.nvim_set_keymap('n', '<leader>pd', [[:lua require('geochip.telescope').search_dotfiles()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pg', [[:lua require('telescope.builtin').live_grep()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pe', [[:lua require('telescope.builtin').diagnostics()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pf', [[:lua require('telescope.builtin').find_files()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pb', [[:lua require('telescope.builtin').buffers()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ps', [[:lua require('telescope.builtin').lsp_document_symbols()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pk', [[:lua require('telescope.builtin').keymaps()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pn', [[:lua require('telescope').extensions.notify.notify()<CR>]], { noremap = true })

return M
