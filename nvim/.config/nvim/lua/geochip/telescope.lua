require('telescope').setup({
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter
  },
  extentions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
})

require('telescope').load_extension('fzy_native')

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = vim.env.DOTFILES,
        follow = true,
    })
end

vim.api.nvim_set_keymap('n', '<leader>pd', ':lua require(\'geochip.telescope\').search_dotfiles()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pg', ':lua require(\'telescope.builtin\').grep_string({ search = vim.fn.input("Grep for > ")})<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pf', ':lua require(\'telescope.builtin\').find_files()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pb', ':lua require(\'telescope.builtin\').buffers()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ps', ':lua require(\'telescope.builtin\').lsp_document_symbols()<CR>', { noremap = true })

return M

