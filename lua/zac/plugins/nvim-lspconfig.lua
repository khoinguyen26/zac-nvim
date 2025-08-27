return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			map("n", "gd", vim.lsp.buf.definition, opts)
			map("n", "gD", vim.lsp.buf.declaration, opts)
			map("n", "gi", vim.lsp.buf.implementation, opts)
			map("n", "gr", vim.lsp.buf.references, opts)
			map("n", "gy", vim.lsp.buf.type_definition, opts)
			map("n", "gs", vim.lsp.buf.signature_help, opts)
			map("n", "K", vim.lsp.buf.hover, opts)
			map("n", "<leader>rn", vim.lsp.buf.rename, opts)
			map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			map("i", "<C-l>", function()
				require("blink.cmp").show()
			end, { desc = "Trigger Blink completion menu" })

			require("mason").setup()
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},

				["vtsls"] = function()
					require("lspconfig").vtsls.setup({})

					-- Tell nvim-lspconfig to explicitly disable ts_ls for all TypeScript filetypes
					require("lspconfig").ts_ls.disable_by_filetype = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					}
				end,
			})
		end,
	},
}
