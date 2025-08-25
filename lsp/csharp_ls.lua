local util = require("lspconfig.util")

return {
	cmd = { "csharp-ls" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		-- Prioritize .sln files, then fall back to .csproj
        local root = util.root_pattern("*.sln", "*.slnx")(fname)
            or util.root_pattern("*.csproj")(fname)
        on_dir(root)
	end,
	filetypes = { "cs" },
	init_options = {
		AutomaticWorkspaceInit = true,
	},
	on_attach = function(client, bufnr)
		require("csharpls_extended").buf_read_cmd_bind()
	end,
}
