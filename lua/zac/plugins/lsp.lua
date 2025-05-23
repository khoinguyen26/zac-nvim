return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "csharp_ls",
                "pyright"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                zls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.zls.setup({
                        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        on_attach = function(client, bufnr)
                            if client.server_capabilities.documentFormattingProvider then
                                -- Format on save
                                vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })]]
                            end
                        end,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true), -- Ensure the LSP can see your runtime files
                                },
                            }
                        }
                    }
                end,
                ["csharp_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.csharp_ls.setup {
                        capabilities = capabilities,
                        on_attach = function(_, bufnr)
                            -- Custom key mappings for LSP
                            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })     -- Go to definition
                            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr })     -- Show references
                            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = bufnr }) -- Go to implementation
                            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })         -- Rename
                            vim.keymap.set("n", "<C-space>", vim.lsp.buf.hover, { buffer = bufnr })
                            vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = bufnr })
                        end,
                        root_dir = lspconfig.util.root_pattern('*.sln', '*.csproj'),
                    }
                end,
                ["gopls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.gopls.setup {
                        capabilities = capabilities,
                        on_attach = function(client, bufnr)
                            if client.server_capabilities.documentFormattingProvider then
                                -- Format on save
                                vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })]]
                            end

                            -- Add key mappings for Go
                            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
                            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr })
                            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = bufnr })
                            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
                        end,
                    }
                end,
                ["rust_analyzer"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.rust_analyzer.setup {
                        capabilities = capabilities,
                        on_attach = function(client, bufnr)
                            -- Format on save if supported
                            if client.server_capabilities.documentFormattingProvider then
                                vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })]]
                            end

                            -- Custom key mappings for Rust
                            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
                            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr })
                            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = bufnr })
                            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
                            vim.keymap.set("n", "<C-space>", vim.lsp.buf.hover, { buffer = bufnr })
                            vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = bufnr })
                        end,
                        settings = {
                            ["rust-analyzer"] = {
                                assist = {
                                    importGranularity = "module",
                                    importPrefix = "by_self",
                                },
                                cargo = {
                                    loadOutDirsFromCheck = true,
                                },
                                procMacro = {
                                    enable = true,
                                },
                                enable_inlay_hints = true,
                                enable_snippets = true
                            },
                        },
                    }
                end,
                ["pyright"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.pyright.setup {
                        capabilities = capabilities,
                        on_attach = function(client, bufnr)
                            if client.server_capabilities.documentFormattingProvider then
                                -- Format on save
                                vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })]]
                            end

                            -- Add key mappings for Python
                            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
                            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr })
                            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = bufnr })
                            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
                            vim.keymap.set("n", "<C-space>", vim.lsp.buf.hover, { buffer = bufnr })
                            vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = bufnr })
                        end,
                    }
                end,
            },
            automatic_installation = true
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<cr>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'luasnip' }
            },
        })


        -- LuaSnip: Add XML Documentation Snippet for C#
        local ls = require 'luasnip'
        ls.config.set_config { history = true }

        ls.add_snippets("cs", {
            ls.snippet("///", {
                ls.text_node("/// <summary>"),
                ls.insert_node(1, "Description here"),
                ls.text_node({ "</summary>", "/// <param name=\"" }),
                ls.insert_node(2, "param"),
                ls.text_node("\">"),
                ls.insert_node(3, "Parameter description"),
                ls.text_node("</param>"),
                ls.insert_node(0),
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
