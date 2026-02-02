local theme_configs = {
	["tokyonight"] = {
		statusline = "lualine",
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
			vim.api.nvim_set_hl(0, "IblScope", { fg = "#dbbc7f", nocombine = true })
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

local current_theme = "tokyonight"

local function theme_spec(repo, name)
	return {
		repo,
		lazy = (current_theme ~= name),
		priority = 1000,
		enabled = (current_theme == name),
		config = theme_configs[name].config,
	}
end

return {
	-- colorschemes
	theme_spec("folke/tokyonight.nvim", "tokyonight"),
	theme_spec("sainnhe/everforest", "everforest"),
	theme_spec("gbprod/nord.nvim", "nord"),
	theme_spec("Mofiqul/dracula.nvim", "dracula"),
	-- statusline
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
