require("notify").setup({
  background_colour = '#000000'
})

-- Other plugins can use the notification windows by setting it as the default notify function
vim.notify = require("notify")

