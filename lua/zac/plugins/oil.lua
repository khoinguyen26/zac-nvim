return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        view_options = {
            show_hidden = true
        },
        keymaps = {
            ["<C-h>"] = false,
            ["<C-l>"] = false,
            ["<C-k>"] = false,
            ["<C-j>"] = false,
            ["<M-h>"] = "actions.select_split",
            ["<M-v>"] = "actions.select_vsplit",
        }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}
