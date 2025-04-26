local conform = require("conform")
conform.setup({
   formatters_by_ft = {
      lua = { "stylua" },
      python = function(bufnr)
         if require("conform").get_formatter_info("ruff_format", bufnr).available then
            return { "ruff_format" }
         else
            return { "isort", "black" }
         end
      end,
      javascript = { "prettier" },
      rust = { "rustfmt", lsp_format = "fallback" },
   },
})

conform.formatters.stylua = {
   prepend_args = { "--indent-type", "Spaces", "--indent-width", "3" },
}

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
   conform.format({
      timeout_ms = 1000,
      lsp_format = "fallback",
   })
end, { desc = "Format file or range (in visual mode)" })
