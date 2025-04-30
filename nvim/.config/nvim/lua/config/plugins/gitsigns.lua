return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
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
          map("n", "<leader>hn", ":Gitsigns next_hunk<CR>")
          map("n", "<leader>hp", ":Gitsigns prev_hunk<CR>")
          map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
          map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
          map("v", "<leader>hs", [[:lua require('gitsigns').stage_hunk { vim.fn.line('.'), vim.fn.line('v') }<CR>]])
          map("v", "<leader>hr", [[:lua require('gitsigns').reset_hunk { vim.fn.line('.'), vim.fn.line('v') }<CR>]])
          map("n", "<leader>hS", ":Gitsigns stage_buffer<CR>")
          map("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>")
          map("n", "<leader>hR", ":Gitsigns reset_buffer<CR>")
          map("n", "<leader>hP", ":Gitsigns preview_hunk<CR>")
          map("n", "<leader>hb", [[:lua require('gitsigns').blame_line { full = true }<CR>]])
          map("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>")
          map("n", "<leader>td", ":Gitsigns toggle_deleted<CR>")

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })
    end,
  }
}
