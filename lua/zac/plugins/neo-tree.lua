return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, for icons
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- Unless you are still migrating, remove the deprecated commands
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

		require("neo-tree").setup({
			close_if_last_window = true, -- Close Neo-tree if it is the last window
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			sort_case_insensitive = true,
			window = {
				position = "left",
				width = 30,
				mappings = {
					["<space>"] = "none", -- Disable space for opening folders
					["o"] = "open",
					["<cr>"] = "open",
					["S"] = "open_split",
					["s"] = "open_vsplit",
					["t"] = "open_tabnew",
					["a"] = "add",
					["d"] = "delete",
					["r"] = "rename",
					["?"] = "show_help",
					["<"] = "prev_source",
					[">"] = "next_source",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true, -- show hidden files by default
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
		})

		-- Keymap to open/close Neo-tree
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
	end,
}
