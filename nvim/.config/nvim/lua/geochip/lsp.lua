local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', ':lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lh', ':lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ln', ':lua vim.lsp.buf.rename()<CR>', opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- linter and formatter
--local null_ls = require("null-ls")
--null_ls.setup({
    --sources = {
        --null_ls.builtins.formatting.stylua,
        --null_ls.builtins.diagnostics.eslint,
        --null_ls.builtins.completion.spell,
        --null_ls.builtins.diagnostics.mypy,
        --null_ls.builtins.diagnostics.pycodestyle,
    --},
--})

-- Enable the following language servers
local lspconfig = require('lspconfig')
local servers = { 'clangd', 'pyright', 'gopls'}
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig.html.setup({
  on_attach = on_attach,
  cpabilities = capabilities,
  filetypes = { 'html', 'htmldjango' }
})

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = on_attach,
    cpabilities = capabilities,
  },
})
