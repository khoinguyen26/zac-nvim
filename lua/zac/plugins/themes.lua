local function get_os()
	if package.config:sub(1, 1) == "\\" then
		return "Windows"
	else
		return "Linux"
	end
end

local my_os = get_os()

return {
	-- themes
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
		enabled = false,
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		enabled = true,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_enable_italic = true
			vim.cmd("let g:everforest_background = 'hard'")
			vim.cmd.colorscheme("everforest")
		end,
	},
	-- status line
	{
		-- "windwp/windline.nvim",
		-- config = function()
		-- 	require("wlsample.airline")
		-- end,

		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					section_separators = "",
					component_separators = { left = "│", right = "│" },
					theme = "everforest",
				},
			})
		end,
	},
}
