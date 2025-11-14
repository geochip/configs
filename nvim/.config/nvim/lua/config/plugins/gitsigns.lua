return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame_opts = {
          delay = 100,
        },
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end)

          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end)

          -- Actions
          map("n", "<leader>hn", "<cmd>Gitsigns next_hunk<CR>")
          map("n", "<leader>hp", "<cmd>Gitsigns prev_hunk<CR>")
          map("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
          map("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
          map("v", "<leader>hs", [[<cmd>lua require('gitsigns').stage_hunk { vim.fn.line('.'), vim.fn.line('v') }<CR>]])
          map("v", "<leader>hr", [[<cmd>lua require('gitsigns').reset_hunk { vim.fn.line('.'), vim.fn.line('v') }<CR>]])
          map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
          map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
          map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
          map("n", "<leader>hP", "<cmd>Gitsigns preview_hunk<CR>")
          map("n", "<leader>hb", [[<cmd>lua require('gitsigns').blame_line { full = true }<CR>]])
          map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
          map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })
    end,
  }
}
