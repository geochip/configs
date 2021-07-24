return require('packer').startup(function()
    use('wbthomason/packer.nvim')

    -- LSP and completion
    use('neovim/nvim-lspconfig')
    use('hrsh7th/vim-vsnip')
    use('hrsh7th/vim-vsnip-integ')
    use('hrsh7th/nvim-compe')

    -- Lua development
    use('tjdevries/nlua.nvim')

    use('windwp/nvim-autopairs')
    use('sheerun/vim-polyglot')
    use({'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}})
    use('preservim/nerdcommenter')
    
    -- Colorschemes
    use('vim-airline/vim-airline')
    use('gruvbox-community/gruvbox')
    use('ayu-theme/ayu-vim')
    use('Yggdroot/indentLine')
end)
