-- Your custom attach function for nvim-lspconfig goes here.
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap = true }
    buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

-- To get builtin LSP running, do something like:
-- NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
require('nlua.lsp.nvim').setup(require('lspconfig'), {
    on_attach = on_attach,
})

require('lspconfig').pyright.setup({
    on_attach = on_attach,
})

require('lspconfig').clangd.setup({
    on_attach = on_attach,
})

