return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    -- Get buffer number and client
                    local bufnr = args.buf

                    -- Define map helper
                    local map = function(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                    end

                    -- LSP keymaps
                    map("n", "gd", vim.lsp.buf.definition, "[g]o to [d]efinition")
                    map("n", "gD", vim.lsp.buf.declaration, "[g]o to [D]eclaration")
                    map("n", "gi", vim.lsp.buf.implementation, "[g]o to [i]mplementation")
                    map("n", "gr", vim.lsp.buf.references, "[g]o to [r]eferences")
                    map("n", "gy", vim.lsp.buf.type_definition, "Go to type [y]pe")
                    map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
                    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
                    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
                    map("n", "<leader>cf", function()
                        vim.lsp.buf.format({ async = true })
                    end, "Format buffer")
                    map("n", "E", vim.diagnostic.open_float, "Show diagnostic")

                    -- for blink
                    map("i", "<C-l>", function()
                        local ok, blink = pcall(require, "blink.cmp")
                        if ok then blink.show() end
                    end, "Trigger Blink completion menu")
                end,
            })

            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        vim.lsp.config(server_name, {})
                        vim.lsp.enable(server_name)
                    end,

                    ["vtsls"] = function()
                        vim.lsp.config("vtsls", {})
                        vim.lsp.enable("vtsls")

                        -- Explicitly prevent ts_ls from starting
                        vim.lsp.config("ts_ls", {
                            enabled = false,
                        })
                    end,
                },

            })
        end,
    },
}
