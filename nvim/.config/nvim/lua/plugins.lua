return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    -- LSP and completion stuff
    use('neovim/nvim-lspconfig')
    use('windwp/nvim-autopairs')
    use('hrsh7th/vim-vsnip')
    use('hrsh7th/vim-vsnip-integ')
    -- Completion framefork
    use('hrsh7th/nvim-cmp')
    -- LSP completion source
    use('hrsh7th/cmp-nvim-lsp')
    -- Other completion sources
    use('hrsh7th/cmp-nvim-lsp-signature-help')
    use('hrsh7th/cmp-nvim-lua')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    -- Deprecated
    --use('williamboman/nvim-lsp-installer')
    --use({'jose-elias-alvarez/null-ls.nvim'})
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    })
    use('onsails/lspkind.nvim')

    -- For lua language server
    -- use('tjdevries/nlua.nvim')

    -- Rust
    use 'simrat39/rust-tools.nvim'

    -- Debugging
    use('mfussenegger/nvim-dap')
    use ({ 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} })
    use('mfussenegger/nvim-dap-python')

    -- Better syntax highlighting
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    -- Mappings for commenting code
    use('preservim/nerdcommenter')

    -- Git integration
    use('tpope/vim-fugitive')
    use('airblade/vim-gitgutter')

    -- Markdown preview
    use({
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Telescope fuzzy finder
    use('nvim-lua/plenary.nvim')
    use('nvim-telescope/telescope.nvim')
    use('nvim-telescope/telescope-fzy-native.nvim')

    -- UI stuff
    use('gruvbox-community/gruvbox')
    use('ayu-theme/ayu-vim')
    use('vim-airline/vim-airline')

    use('rcarriga/nvim-notify')
    --use('Yggdroot/indentLine')
    use("lukas-reineke/indent-blankline.nvim")
    use('ryanoasis/vim-devicons')
    use('kyazdani42/nvim-web-devicons')
    --use('norcalli/nvim-colorizer.lua')

    -- Temporary commented out
    use('sheerun/vim-polyglot')

    --use('nvim-lua/popup.nvim')
    --use('ray-x/lsp_signature.nvim')
end)

