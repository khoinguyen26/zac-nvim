return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

		-- for lsp
		vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Find list of definitions" })
		vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Find list of implementations" })
		vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Find list of references" })
		vim.keymap.set("n", "<leader>gy", builtin.lsp_type_definitions, { desc = "Find list of type definitions" })
	end,
}
