local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', ':lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lh', ':lua vim.lsp.buf.hover({border="rounded"})<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ln', ':lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', ':lua vim.lsp.buf.format()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lq', ':LspRestart<CR>', opts)

  -- if client.server_capabilities.inlayHintProvider then
  --   vim.lsp.inlay_hint.enable(true)
  -- end
end

-- Disable mapping of K to vim.lsp.buf.hover()
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    pcall(function() vim.keymap.del('n', 'K', { buffer = ev.buf }) end)
  end,
})


-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Border
local border = "rounded"
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- Enable the following language servers
local lspconfig = require('lspconfig')
local servers = {
  'lua_ls',
  'clangd',
  'pyright',
  'rust_analyzer',
  'zls',
  'gopls',
  'bashls',
  'intelephense',
  'lemminx',
  'ts_ls',
  'java_language_server',
  'cssls',
  'cmake',
}
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  })
end

lspconfig.html.setup({
  on_attach = on_attach,
  cpabilities = capabilities,
  handlers = handlers,
  filetypes = { 'html', 'htmldjango' }
})

-- pyright setup
local util = require("vim.lsp.util")

local function my_split_lines(s, no_blank)
  s = string.gsub(s, '&nbsp;', ' ')
  s = string.gsub(s, '\r\n?', '\n')
  local lines = {}
  local in_desc = true -- Main description block, before seeing any @foo.
  for line in vim.gsplit(s, '\n', { plain = true, trimempty = true }) do
    local start_annotation = not not line:find('^ ?%@.?[pr]')
    in_desc = (not start_annotation) and in_desc or false
    if start_annotation and no_blank and not (lines[#lines] or ''):find('^%s*$') then
      table.insert(lines, '') -- Separate each @foo with a blank line.
    end
    if in_desc or not no_blank or not line:find('^%s*$') then
      table.insert(lines, line)
    end
  end
  return lines
end

local function my_convert_input_to_markdown_lines(input, contents)
  contents = contents or {}
  -- MarkedString variation 1
  if type(input) == 'string' then
    vim.list_extend(contents, my_split_lines(input, true))
  else
    assert(type(input) == 'table', 'Expected a table for LSP input')
    -- MarkupContent
    if input.kind then
      local value = input.value or ''
      vim.list_extend(contents, my_split_lines(value, true))
      -- MarkupString variation 2
    elseif input.language then
      table.insert(contents, '```' .. input.language)
      vim.list_extend(contents, my_split_lines(input.value or ''))
      table.insert(contents, '```')
      -- By deduction, this must be MarkedString[]
    else
      -- Use our existing logic to handle MarkedString
      for _, marked_string in ipairs(input) do
        my_convert_input_to_markdown_lines(marked_string, contents)
      end
    end
  end
  if (contents[1] == '' or contents[1] == nil) and #contents == 1 then
    return {}
  end
  return contents
end

local function my_hover(_, result, ctx, config)
  config = config or {}
  config.focus_id = ctx.method
  if vim.api.nvim_get_current_buf() ~= ctx.bufnr then
    -- Ignore result since buffer changed. This happens for slow language servers.
    return
  end
  if not (result and result.contents) then
    if config.silent ~= true then
      vim.notify("No information available")
    end
    return
  end
  local format = 'markdown'
  local contents ---@type string[]
  if type(result.contents) == 'table' and result.contents.kind == 'plaintext' then
    format = 'plaintext'
    contents = vim.split(result.contents.value or '', '\n', { trimempty = true })
  else
    contents = my_convert_input_to_markdown_lines(result.contents)
  end
  if vim.tbl_isempty(contents) then
    if config.silent ~= true then
      vim.notify('No information available')
    end
    return
  end
  return util.open_floating_preview(contents, format, config)
end

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = {
    -- ["textDocument/hover"] = vim.lsp.with(my_hover, {
    ["textDocument/hover"] = vim.lsp.with(my_hover, {
      border = "rounded",
      -- title = " |･ω･) ? ",
      -- max_width = 120,
      -- zindex = 500,
    }),
  },
  settings = {
    pyright = {
      disableOrganizeImports = false,
    },
   --  python = {
   --    analysis = {
   --      ignore = { "*" },
   --      logLevel = "Information",
   --      autoImportCompletions = true,
   --      autoSearchPaths = true,
   --      diagnosticMode = "off",
   --      typeCheckingMode = "off",
   --      useLibraryCodeForTypes = false,
   --   },
   -- },
 },
})

