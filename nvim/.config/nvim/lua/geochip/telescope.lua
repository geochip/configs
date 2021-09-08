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

return M

