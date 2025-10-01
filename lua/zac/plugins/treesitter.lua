return {

	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				enable = true,
			},
		},
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"heex",
				"javascript",
				"html",
				"c_sharp",
				"typescript",
				"tsx",
				"json",
				"css",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})

		vim.wo.foldmethod = "indent"
		-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldlevel = 99
	end,
}
