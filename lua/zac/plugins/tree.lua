return {
	{
		"stevearc/oil.nvim",
		enabled = false,
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["<C-k>"] = false,
				["<C-j>"] = false,
				["<M-h>"] = "actions.select_split",
				["<M-v>"] = "actions.select_vsplit",
			},
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>e", ":NvimTreeToggle<CR>", desc = "Find file in filetree" },
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
