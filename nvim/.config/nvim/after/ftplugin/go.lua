local indent = 4
vim.bo.tabstop = indent
vim.bo.softtabstop = indent
vim.bo.shiftwidth = indent
vim.bo.expandtab = false

vim.wo.colorcolumn = "89"

vim.bo.makeprg = "go build"
vim.api.nvim_set_keymap("n", "<leader>k", ":make<CR>", { noremap = true })
