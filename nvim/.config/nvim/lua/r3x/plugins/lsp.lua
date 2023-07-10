return {
    {
        "williamboman/mason.nvim",
        event = "BufReadPre",
        opts = {
            ensure_installed = {
                "prettierd",
                "stylua",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/neodev.nvim",
            "RRethy/vim-illuminate",
        },
        event = "BufReadPre",
        config = function()
            require("neodev").setup()
            local lspconfig = require("lspconfig")
            local root_pattern = require("lspconfig.util").root_pattern
            local on_attach = require("r3x.handlers").on_attach
            local capabilities = require("r3x.handlers").capabilities

            local servers = { "prismals", "dockerls" }

            for _, lsp in pairs(servers) do
                lspconfig[lsp].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end

            lspconfig["lua_ls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        hint = { enable = true },
                    },
                },
            })

            lspconfig["pyright"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            lspconfig["tsserver"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    javascript = {
                        inlayHints = {
                            includeInlayEnumMemberValueHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                    typescript = {
                        inlayHints = {
                            includeInlayEnumMemberValueHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                },
            })

            lspconfig["rust_analyzer"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "rustup", "run", "stable", "rust-analyzer" }, --TODO: `rustup component add rust-analyzer` to install LSP
                settings = {
                    ["rust-analyzer"] = {
                        procMacro = { enable = true },
                        cargo = { allFeatures = true },
                        checkOnSave = true,
                        check = {
                            command = "clippy", --TODO: `rustup component add clippy` to install clippy
                            extraArgs = { "--no-deps" },
                        },
                    },
                },
            })

            lspconfig["gopls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        gofumpt = true,
                        staticcheck = true,
                        analyses = {
                            unusedparams = true,
                        },
                    },
                },
                flags = {
                    debounce_text_changes = 120,
                },
            })

            lspconfig["yamlls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    yaml = {
                        keyOrdering = false,
                    },
                },
            })

            local cap = capabilities
            cap.offsetEncoding = "utf-8"

            lspconfig["clangd"].setup({
                on_attach = on_attach,
                capabilities = cap,
            })

            lspconfig["cssls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    css = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                    scss = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                    less = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                },
            })

            lspconfig["tailwindcss"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = root_pattern("tailwind.config.js", "postcss.config.js"),
            })

            require("r3x.handlers").setup()
        end,
    },
    -- inlay hints
    {
        "lvimuser/lsp-inlayhints.nvim",
        event = "LspAttach",
        keys = {
            {
                "<leader>lh",
                function()
                    require("lsp-inlayhints").toggle()
                end,
                desc = "Toggle inlay hints",
            },
        },
        opts = {
            inlay_hints = {
                parameter_hints = {
                    show = true,
                    prefix = "<- ",
                    separator = ", ",
                    remove_colon_start = false,
                    remove_colon_end = true,
                },
                type_hints = {
                    show = true,
                    prefix = " » ",
                    separator = ", ",
                    remove_colon_start = false,
                    remove_colon_end = false,
                },
                only_current_line = false,
                labels_separator = "  ", -- gap between type hints and parameter hints
                highlight = "Comment", -- see `:highlight` for more options
            },
        },
    },
    -- code formatters
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "LspAttach",
        config = function()
            local nls = require("null-ls")

            nls.setup({
                debug = false,
                sources = {
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.prettierd.with({
                        disabled_filetypes = { "markdown", "yaml" },
                    }),
                },
            })
        end,
    },
    {
        "stevearc/dressing.nvim",
        event = "LspAttach",
        opts = {
            input = {
                enabled = false,
            },
        },
    },
}
