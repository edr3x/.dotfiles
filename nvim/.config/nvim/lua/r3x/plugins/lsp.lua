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
                "gopls",
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
                    },
                },
            })

            lspconfig["rust_analyzer"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "rustup", "run", "stable", "rust-analyzer" }, --TODO: `rustup component add rust-analyzer` to install LSP
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
