return {
  {
    "vimwiki/vimwiki",
    config = function()
      vim.keymap.set("n", "<leader>wa", "<cmd>VimwikiAll2HTML<cr>")
    end
  }
}
