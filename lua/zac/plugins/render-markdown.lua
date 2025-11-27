return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" }, -- Only load for markdown files
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
}
