local lspkind = require('lspkind')
lspkind.init()

require('cmp_nvim_lsp').setup()

local cmp = require('cmp')
cmp.setup({
  completion = {
    autocomplete = false,
  },

  -- snippet = {
  --   expand = function(args)
  --     vim.fn["vsnip#anonymous"](args.body)
  --   end,
  -- },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true
    }),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
  }),

  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
--      { name = 'nvim_lsp_signature_help' },
--      { name = 'nvim_lua' },
--      { name = 'vsnip' },
      { name = 'buffer' },
      { name = 'path' }
  }),

  formatting = {
    format = lspkind.cmp_format({
        with_text = true,
        menu = {
            nvim_lsp = '[LSP]',
            nvim_lua = '[api]',
            -- vsnip = '[snip]',
            buffer = '[buf]',
            path = '[path]',
        }
    })
  },

  experimental = {
      native_menu = false
  }
})

