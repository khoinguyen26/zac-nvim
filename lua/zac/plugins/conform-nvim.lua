return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			markdown = { "prettier" },
		},
		-- Set up format on save
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
