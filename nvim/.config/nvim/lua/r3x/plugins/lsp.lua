return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/neodev.nvim",
            "RRethy/vim-illuminate",
            "williamboman/mason-lspconfig.nvim",
            { "williamboman/mason.nvim", config = true },
        },
        event = "BufReadPre",
        config = function()
            require("neodev").setup()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            local lsp_conf = require("r3x.lsp_settings")
            local on_attach = require("r3x.lsp_settings").on_attach
            local cap = vim.lsp.protocol.make_client_capabilities()
            local capabilities = require("cmp_nvim_lsp").default_capabilities(cap)

            local servers = {
                prismals = {},
                dockerls = {},
                pyright = {},
                clangd = {},
                svelte = {},
                -- tailwindcss = {},
                gopls = lsp_conf.go,
                cssls = lsp_conf.css,
                lua_ls = lsp_conf.lua,
                yamlls = lsp_conf.yaml,
                tsserver = lsp_conf.ts,
                rust_analyzer = lsp_conf.rust,
                html = { filetypes = { "html", "hbs" } },
                terraformls = { filetypes = { "terraform", "tf" } },
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

            require("r3x.lsp_settings").setup()

            require("illuminate").configure({
                delay = 200,
                large_file_cutoff = 2000,
                large_file_overrides = {
                    providers = { "lsp" },
                },
            })
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
