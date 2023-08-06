return {
    {
        "folke/neodev.nvim",
        ft = { "lua" },
        opts = {},
    },
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
        "RRethy/vim-illuminate",
        event = "BufReadPost",
        config = function()
            require("illuminate").configure({
                delay = 200,
                large_file_cutoff = 2000,
                large_file_overrides = {
                    providers = { "lsp" },
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        config = function()
            local lspconfig = require("lspconfig")

            local on_attach = require("r3x.handlers").on_attach
            local capabilities = require("r3x.handlers").capabilities
            local settings = require("r3x.handlers").settings

            local servers = {
                "prismals",
                "dockerls",
                "pyright",
                -- "tailwindcss",
                "svelte",
                "lua_ls",
                "tsserver",
                "gopls",
                "yamlls",
                "cssls",
            }

            for _, lsp in pairs(servers) do
                lspconfig[lsp].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = settings,
                })
            end

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

            local cap = capabilities
            cap.offsetEncoding = "utf-8"
            lspconfig["clangd"].setup({
                on_attach = on_attach,
                capabilities = cap,
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
}
