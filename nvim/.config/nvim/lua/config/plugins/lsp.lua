return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "saghen/blink.cmp",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.enable({
        "lua_ls",
        "rust_analyzer",
        "clangd",
      })

      vim.keymap.set({ "n", "v" }, "<leader>lf", function() vim.lsp.buf.format() end)
    end,
  },
}
