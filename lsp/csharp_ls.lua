local util = require("lspconfig.util")

return {
	cmd = { "csharp-ls" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		on_dir(
			util.root_pattern("*.sln")(fname)
				or util.root_pattern("*.slnx")(fname)
				or util.root_pattern("*.csproj")(fname)
		)
	end,
	filetypes = { "cs" },
	init_options = {
		AutomaticWorkspaceInit = true,
	},
}
