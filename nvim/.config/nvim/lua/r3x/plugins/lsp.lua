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
            "ray-x/lsp_signature.nvim",
            "RRethy/vim-illuminate",
        },
        event = "BufReadPre",
        config = function()
            local lspconfig = require("lspconfig")
            local on_attach = require("r3x.handlers").on_attach
            local capabilities = require("r3x.handlers").capabilities

            local servers = {
                "tsserver",
                "prismals",
                "dockerls",
                "cssls",
                -- "tailwindcss",
            }

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
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                    },
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

            require("r3x.handlers").setup()
        end,
    },
    {
        "simrat39/inlay-hints.nvim",
        event = "LspAttach",
        opts = {
            renderer = "inlay-hints/render/eol", -- dynamic, eol, virtline or custom
            hints = {
                parameter = {
                    show = true,
                    highlight = "Comment",
                },
                type = {
                    show = true,
                    highlight = "Comment",
                },
            },
            only_current_line = false,
            eol = {
                right_align = false, -- whether to align to the extreme right or not
                right_align_padding = 7, -- padding from the right if right_align is true
                parameter = {
                    separator = ", ",
                    format = function(hints)
                        return string.format(" <- (%s)", hints)
                    end,
                },
                type = {
                    separator = ", ",
                    format = function(hints)
                        return string.format(" »  (%s)", hints)
                    end,
                },
            },
        },
    },
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
}
