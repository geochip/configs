-- GLOBAL VARIABLES
vim.g.mapleader = " "

require("config.lazy")
require("config.sets")

-- KEYMAPPINGS
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>.lua<CR>")
vim.keymap.set("v", "<leader>x", "<cmd>lua<CR>")

vim.keymap.set("n", "<leader>d", '<cmd>lua vim.diagnostic.open_float({border="rounded"})<CR>', { noremap = true })

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { noremap = true })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { noremap = true })

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { noremap = true })

vim.keymap.set("n", "<leader>u", "<cmd>nohlsearch<CR>", { noremap = true })

vim.keymap.set("v", "J", [[:m '>+1<CR>gv=gv]], { noremap = true })
vim.keymap.set("v", "K", [[:m '<-2<CR>gv=gv]], { noremap = true })

vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })
vim.keymap.set("n", "J", "mzJ`z", { noremap = true })

vim.keymap.set(
   "n",
   "<leader>s",
   "iSigned-off-by: Alexander Stepchenko <geochip@altlinux.org><ESC>",
   { noremap = true }
)

-- AUTOCOMMANDS
vim.cmd([[
    augroup GEOCHIP
        autocmd!
        autocmd BufNewFile,BufRead /dev/shm/gopass* setlocal noswapfile nobackup noundofile shada=""
        autocmd BufWritePre * %s/\s\+$//e
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
        autocmd BufRead *.ovf set filetype=xml
    augroup END
]])

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("geochip-hl-on-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end
})

-- Diagnostics
-- vim.cmd("highlight LspDiagnosticsDefaultError guifg=red gui=bold")
-- vim.cmd("highlight LspDiagnosticsDefaultWarning guifg=orange gui=bold")
-- vim.cmd("highlight LspDiagnosticsDefaultInformation guifg=yellow gui=bold")
-- vim.cmd("highlight LspDiagnosticsDefaultHint guifg=green gui=bold")
