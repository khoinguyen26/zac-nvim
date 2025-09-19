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
		formatters = {
			prettier = {
				args = { "--trailing-comma", "es5" },
			},
			prettierd = {
				args = { "--trailing-comma", "es5" },
			},
		},
		-- Set up format on save
		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},
	},
}
