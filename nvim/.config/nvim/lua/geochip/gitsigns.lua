require('gitsigns').setup({
    signs               = {
        add          = { text = '+' },
        change       = { text = '~' },
        --delete       = { text = '_' },
        --topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        --untracked    = { text = '┆' },
        untracked    = { text = '^' },
    },
    signcolumn          = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl               = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl              = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff           = false, -- Toggle with `:Gitsigns toggle_word_diff`
    auto_attach         = true,
    attach_to_untracked = false,
    current_line_blame  = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    sign_priority       = 10,
    on_attach           = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then
                vim.cmd.normal({ ']c', bang = true })
            else
                gitsigns.nav_hunk('next')
            end
        end)

        map('n', '[c', function()
            if vim.wo.diff then
                vim.cmd.normal({ '[c', bang = true })
            else
                gitsigns.nav_hunk('prev')
            end
        end)

        -- Actions
        map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('v', '<leader>hs', [[:lua require('gitsigns').stage_hunk { vim.fn.line('.'), vim.fn.line('v') }<CR>]])
        map('v', '<leader>hr', [[:lua require('gitsigns').reset_hunk { vim.fn.line('.'), vim.fn.line('v') }<CR>]])
        map('n', '<leader>hS', ':Gitsigns stage_buffer<CR>')
        map('n', '<leader>hu', ':Gitsigns undo_stage_hunk<CR>')
        map('n', '<leader>hR', ':Gitsigns reset_buffer<CR>')
        map('n', '<leader>hp', ':Gitsigns preview_hunk<CR>')
        map('n', '<leader>hb', [[:lua require('gitsigns').blame_line { full = true }<CR>]])
        map('n', '<leader>tb', ':Gitsigns toggle_current_line_blame<CR>')
        --map('n', '<leader>hd', [[:lua require('gitsigns').diffthis()<CR>]])
        --map('n', '<leader>hD', [[:lua require('gitsigns').diffthis('~')<CR>]])
        map('n', '<leader>td', ':Gitsigns toggle_deleted<CR>')

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
})
