local theme_configs = {
	["tokyonight"] = {
		statusline = "windline",
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	["everforest"] = {
		statusline = "lualine",
		lualine_theme = "everforest",
		config = function()
			vim.g.everforest_enable_italic = true
			vim.cmd("let g:everforest_background = 'hard'")
			vim.cmd.colorscheme("everforest")
		end,
	},
	["rose-pine"] = {
		statusline = "lualine",
		lualine_theme = "rose-pine",
		config = function()
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
	["nord"] = {
		statusline = "lualine",
		lualine_theme = "nord",
		config = function()
			vim.cmd.colorscheme("nord")
			require("treesitter-context")

			-- Set custom background color for context block
			vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#2d2d2d" })
			vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = "#2d2d2d" })
		end,
	},
	["dracula"] = {
		statusline = "lualine",
		lualine_theme = "dracula",
		config = function()
			vim.cmd.colorscheme("dracula")

			require("treesitter-context")

			-- Set custom background color for context block
			vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#3B4048" })
			vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = "#3B4048" })
		end,
	},
}

local current_theme = "nord"

return {
	-- colorschemes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		enabled = (current_theme == "tokyonight"),
		config = theme_configs["tokyonight"].config,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		enabled = (current_theme == "everforest"),
		config = theme_configs["everforest"].config,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		enabled = (current_theme == "rose-pine"),
		config = theme_configs["rose-pine"].config,
	},
	{
		"gbprod/nord.nvim",
		lazy = fasle,
		priority = 1000,
		enabled = (current_theme == "nord"),
		config = theme_configs["nord"].config,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		enabled = (current_theme == "dracula"),
		config = theme_configs["dracula"].config,
	},
	-- statusline
	{
		"windwp/windline.nvim",
		enabled = (theme_configs[current_theme].statusline == "windline"),
		config = function()
			require("wlsample.airline")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		enabled = (theme_configs[current_theme].statusline == "lualine"),
		config = function()
			local theme_name = theme_configs[current_theme].lualine_theme or "auto"
			require("lualine").setup({
				options = {
					-- section_separators = "",
					-- component_separators = { left = "│", right = "│" },
					theme = theme_name,
				},
			})
		end,
	},
}
