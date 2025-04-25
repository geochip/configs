-- SETS
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

local indent = 4
vim.bo.tabstop = indent
vim.bo.softtabstop = indent
vim.bo.shiftwidth = indent
vim.bo.expandtab = true
vim.bo.autoindent = true

vim.bo.swapfile = false
vim.o.backup = false
vim.bo.undofile = true

-- set statusline=%f\ %=Line\ %l/%L\ Col\ %c\ (%p%%)

vim.o.completeopt = 'menuone,noselect'
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.scrolloff = 8
vim.o.cmdheight = 2
vim.o.listchars = 'trail:·,tab:  ,extends:>,precedes:<'

vim.o.guicursor = ""

vim.wo.colorcolumn = '79'
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.wrap = false
vim.wo.list = true
vim.wo.signcolumn = 'yes'

vim.g.vim_markdown_conceal_code_blocks = 0

local function escape(str)
  -- You need to escape these characters to work correctly
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
    -- | `to` should be first     | `from` should be second
    escape(ru_shift) .. ';' .. escape(en_shift),
    escape(ru) .. ';' .. escape(en),
}, ',')
