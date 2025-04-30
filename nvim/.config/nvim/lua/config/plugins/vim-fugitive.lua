return {
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gs",        "<cmd>Git<CR>", noremap = true },
      { "<leader>gd",        "<cmd>Gvdiffsplit<CR>", noremap = true },
      { "<leader>gt",        "<cmd>Gvdiffsplit!<CR>", noremap = true },
      { "<leader>gll",       "<cmd>tab Git log --decorate --graph<CR>", noremap = true },
      { "<leader>gl<space>", "<cmd>tab Git log --decorate --graph ", noremap = true },
    }
  },
}
