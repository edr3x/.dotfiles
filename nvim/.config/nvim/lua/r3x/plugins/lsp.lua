return {
    {
        "RRethy/vim-illuminate",
        event = "LspAttach",
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
        dependencies = {
            "folke/neodev.nvim",
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
        },
        event = "BufReadPre",
        config = function()
            require("neodev").setup()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            local on_attach = require("r3x.handlers").on_attach
            local cap = vim.lsp.protocol.make_client_capabilities()
            local capabilities = require("cmp_nvim_lsp").default_capabilities(cap)

            local servers = {
                prismals = {},
                dockerls = {},
                pyright = {},
                clangd = {},
                -- tailwindcss = {},
                svelte = {},
                html = { filetypes = { "html", "hbs" } },
                cssls = require("r3x.lsp_config.css"),
                lua_ls = require("r3x.lsp_config.lua"),
                tsserver = require("r3x.lsp_config.ts"),
                rust_analyzer = require("r3x.lsp_config.rust"),
                gopls = require("r3x.lsp_config.go"),
                yamlls = require("r3x.lsp_config.yaml"),
            }

            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = servers[server_name],
                        filetypes = (servers[server_name] or {}).filetypes,
                    })
                end,
            })

            require("r3x.handlers").setup()
        end,
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
