local function get_os()
	if package.config:sub(1, 1) == "\\" then
		return "Windows"
	else
		return "Linux"
	end
end

local my_os = get_os()

return {
	{
		"rose-pine/neovim",
		lazy = false,
		name = "rose-pine",
		-- enabled = (my_os == "Linux"),
		enabled = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		enabled = true,
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_enable_italic = true
			vim.cmd("let g:everforest_background = 'hard'")
			vim.cmd.colorscheme("everforest")
		end,
	},
}
