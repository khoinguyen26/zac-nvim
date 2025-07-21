return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				-- Next hunk
				vim.keymap.set("n", "]h", function()
					gs.next_hunk()
				end, { buffer = bufnr, desc = "Next Git hunk" })

				-- Previous hunk
				vim.keymap.set("n", "[h", function()
					gs.prev_hunk()
				end, { buffer = bufnr, desc = "Previous Git hunk" })
			end,
		})
	end,
}
