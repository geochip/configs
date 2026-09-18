return {
	{
		"vimwiki/vimwiki",
		init = function()
            vim.treesitter.language.register("markdown", "vimwiki")
			vim.g.vimwiki_global_ext = 0
			vim.g.vimwiki_conceallevel = 0
			vim.g.vimwiki_list = {
				{
					path = "~/vimwiki/",
					syntax = "markdown",
					ext = "md",
					-- custom_wiki2html = "vimwiki_markdown",
					custom_wiki2html = "wiki2html.sh",
				},
			}
		end,
		config = function()
			vim.keymap.set("n", "<leader>wa", "<cmd>VimwikiAll2HTML<cr>")
		end,
	},
}
