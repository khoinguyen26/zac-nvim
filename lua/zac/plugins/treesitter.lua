return {

    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                enable = true
            }
        }
    },
    opts = {
        ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "heex",
            "javascript",
            "html",
            "c_sharp",
            "typescript",
            "tsx",
            "json",
            "css",
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter").setup(opts)
        vim.wo.foldmethod = "indent"
        vim.wo.foldlevel = 99
    end,
}
