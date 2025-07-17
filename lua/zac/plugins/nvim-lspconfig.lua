return {
	"neovim/nvim-lspconfig",
	config = function()
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "gi", vim.lsp.buf.implementation, opts)
		map("n", "gr", vim.lsp.buf.references, opts)
		map("n", "gy", vim.lsp.buf.type_definition, opts)
		map("n", "K", vim.lsp.buf.hover, opts)
		map("n", "<leader>rn", vim.lsp.buf.rename, opts)
		map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
}
