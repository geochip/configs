local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
	},
	-- format_on_save = {
	-- 	timeout_ms = 500,
	-- 	lsp_format = "fallback",
	-- },
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
		timeout_ms = 500,
		lsp_format = "fallback",
	})
end, { desc = "Format file or range (in visual mode)" })
