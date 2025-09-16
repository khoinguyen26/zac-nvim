local theme_configs = {
    ["tokyonight"] = {
        statusline = "windline",
        config = function()
            vim.cmd([[colorscheme tokyonight-night]])
        end
    },
    ["everforest"] = {
        statusline = "lualine",
        lualine_theme = "everforest",
        config = function()
            vim.g.everforest_enable_italic = true
            vim.cmd("let g:everforest_background = 'hard'")
            vim.cmd.colorscheme("everforest")
        end
    },
    ["rose-pine"] = {
        statusline = "lualine",
        lualine_theme = "rose-pine",
        config = function()
            vim.cmd([[colorscheme rose-pine]])
        end
    },
    ["monokai-pro"] = {
        statusline = "lualine",
        lualine_theme = "gruvbox_dark",
        config = function()
            require("monokai-pro").setup()
            vim.cmd.colorscheme("monokai-pro")
        end
    }
}

local current_theme = "everforest"


return {
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
        "loctvl842/monokai-pro.nvim",
        lazy = fasle,
        priority = 1000,
        enabled = (current_theme == "monokai-pro"),
        config = theme_configs["monokai-pro"].config
    },
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
                    section_separators = "",
                    component_separators = { left = "│", right = "│" },
                    theme = theme_name,
                },
            })
        end,
    },
}
