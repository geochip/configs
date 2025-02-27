return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- LSP and completion stuff
	use("neovim/nvim-lspconfig")
	-- use("windwp/nvim-autopairs")
	-- use("hrsh7th/vim-vsnip")
	-- use("hrsh7th/vim-vsnip-integ")
	-- Completion framefork
	use("hrsh7th/nvim-cmp")
	-- LSP completion source
	use("hrsh7th/cmp-nvim-lsp")
	-- Other completion sources
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})
	use("onsails/lspkind.nvim")

	-- For lua language server
	-- use('tjdevries/nlua.nvim')

	-- Formatting
	use("stevearc/conform.nvim")

	-- Linting
	use("mfussenegger/nvim-lint")

	-- Rust
	use("simrat39/rust-tools.nvim")

	-- Better syntax highlighting
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")

	-- Mappings for commenting code
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Git integration
	use("tpope/vim-fugitive")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({
		"NeogitOrg/neogit",
		requires = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			--'ibhagwan/fzf-lua',      -- optional
		},
		config = function()
			require("neogit").setup({})
		end,
	})
	--use('airblade/vim-gitgutter')

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Obsidian integration
	-- use({
	--     "epwalsh/obsidian.nvim",
	--     tag = "*", -- recommended, use latest release instead of latest commit
	--     requires = {
	--         -- Required.
	--         "nvim-lua/plenary.nvim",
	--     },
	--     config = function()
	--         require("obsidian").setup({
	--             workspaces = {
	--                 {
	--                     name = "work",
	--                     path = "~/Dropbox/work_vault",
	--                 },
	--             },
	--         })
	--     end,
	-- })

	-- Telescope fuzzy finder
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")

	-- Harpoon
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- UI stuff
	use("gruvbox-community/gruvbox")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("ayu-theme/ayu-vim")
	--use('vim-airline/vim-airline')
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup()
		end,
	})
	use("mbbill/undotree")
	use({
		"stevearc/oil.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()
		end,
	})

	--use('rcarriga/nvim-notify')
	--use("lukas-reineke/indent-blankline.nvim")
	use("ryanoasis/vim-devicons")
	use("kyazdani42/nvim-web-devicons")
	--use('norcalli/nvim-colorizer.lua')

	-- Temporary commented out
	use("sheerun/vim-polyglot")

	--use('nvim-lua/popup.nvim')
	--use('ray-x/lsp_signature.nvim')
end)
