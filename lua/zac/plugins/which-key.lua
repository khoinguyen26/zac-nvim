return {
	"folke/which-key.nvim",
	event = "VeryLazy", -- loads on demand for speed
	opts = {}, -- you can add custom options here, or leave empty for defaults
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
