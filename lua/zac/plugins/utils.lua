return {
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            -- No config needed for basic functionality
            require("illuminate").configure({
                large_file_cutoff = 20000
            })
        end
    },
    -- auto pairs brackets
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = {},
    },
    {
        'numToStr/Comment.nvim',
        event = "VeryLazy",
        opts = {
            -- add any options here
        }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy", -- loads on demand for speed
        opts = {},          -- you can add custom options here, or leave empty for defaults
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = {
				char = "│",
			},
			scope = {
				show_start = false,
			},
		},
	},
}
