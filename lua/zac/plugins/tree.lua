return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>e", ":NvimTreeToggle<CR>", desc = "Open filetree" },
			{ "<leader>pv", ":NvimTreeFindFile<CR>", desc = "Find file in filetree" },
		},
		opts = {
			view = {
				adaptive_size = true,
				float = {
					enable = true,
				},
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				-- Apply default mappings first
				api.config.mappings.default_on_attach(bufnr)

				-- Custom mappings
				local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
				vim.keymap.set("n", "l", api.node.open.edit, opts) -- expand or open
				vim.keymap.set("n", "h", api.node.navigate.parent_close, opts) -- collapse
			end,
		},
	},
}
