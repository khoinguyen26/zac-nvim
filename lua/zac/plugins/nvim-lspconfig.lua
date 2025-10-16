return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            local map = vim.keymap.set
            local opts = { noremap = true, silent = true, desc = "[g]o to [d]efinition" }

            map("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "[g]o to [d]efinition" })
            map("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "[g]o to [D]eclaration" })
            map("n", "gi", vim.lsp.buf.implementation,
                { noremap = true, silent = true, desc = "[g]o to [i]mplementation" })
            map("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "[g]o to [r]eferences" })
            map("n", "gy", vim.lsp.buf.type_definition,
                { noremap = true, silent = true, desc = "[g]o to t[y]pe definition" })
            map("n", "gs", vim.lsp.buf.signature_help, { noremap = true, silent = true, desc = "[g]o [s]ignature help" })
            map("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Show info" })
            map("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "rename" })
            map("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "[c]ode [a]ction" })
            map("i", "<C-l>", function()
                require("blink.cmp").show()
            end, { desc = "Trigger Blink completion menu" })

            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup {}
                    end,

                    ["vtsls"] = function()
                        require("lspconfig").vtsls.setup({})

                        -- Tell nvim-lspconfig to explicitly disable ts_ls for all TypeScript filetypes
                        require("lspconfig").ts_ls.disable_by_filetype = {
                            "javascript",
                            "javascriptreact",
                            "javascript.jsx",
                            "typescript",
                            "typescriptreact",
                            "typescript.tsx",
                        }
                    end,

                },

            })
        end,
    },
}
