local lint = require("lint")

lint.linters_by_ft = {
	python = { "pylint", "flake8" },
}

vim.keymap.set("n", "<leader>ml", function()
	lint.try_lint()
end, { desc = "Lint the current file" })
