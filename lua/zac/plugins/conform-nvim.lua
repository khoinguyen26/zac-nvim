return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			markdown = { "prettier" },
		},
		formatters = {
			prettier = {
				command = "npx",
				args = { "prettier", "--stdin-filepath", "$FILENAME" },
			},
		},
		-- Set up format on save
		format_on_save = {
			timeout_ms = 5000,
			lsp_fallback = true,
		},
	},
}
