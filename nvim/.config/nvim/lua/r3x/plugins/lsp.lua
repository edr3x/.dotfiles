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
            local on_attach = require("r3x.handlers").on_attach
            local capabilities = require("r3x.handlers").capabilities

            local servers = {
                "tsserver",
                "gopls",
                "prismals",
                "yamlls",
                "dockerls",
                "cssls",
                -- "tailwindcss",
            }

            require("lspconfig").lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = { Lua = { diagnostics = { globals = { "vim" } } } },
            })

            for _, lsp in pairs(servers) do
                require("lspconfig")[lsp].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end

            require("r3x.handlers").setup()
        end,
    },
}
