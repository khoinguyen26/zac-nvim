return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope", -- Lazy load on command
	keys = { -- Lazy load on these keymaps
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
		{ "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Find list of definitions" },
		{ "<leader>gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Find list of implementations" },
		{ "<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "Find list of references" },
		{ "<leader>gy", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Find list of type definitions" },
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				path_display = { "filename_first" }, -- or "tail"
			},
		})
	end,
}
