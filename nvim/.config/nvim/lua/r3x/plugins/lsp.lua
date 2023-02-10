return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'ray-x/lsp_signature.nvim',
        'RRethy/vim-illuminate',
        'windwp/nvim-ts-autotag',
    },
    event = "BufReadPre",
    config = function()
        local servers = {
            'clangd',
            'sumneko_lua',
            'gopls',
            'prismals',
            'rust_analyzer',
            'pyright',
            'yamlls',
            'dockerls',
            'graphql',
            -- 'tailwindcss',
            -- 'cssls',
        }

        local opts = {
            ensure_installed = servers,
            automatic_installation = true,
        }

        local lsp_settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim', 'awesome', 'client' }
                }
            }
        }

        require("mason").setup()
        require("mason-lspconfig").setup(opts)
        for _, lsp in pairs(servers) do
            require("lspconfig")[lsp].setup {
                on_attach = require("r3x.handlers").on_attach,
                capabilities = require("r3x.handlers").capabilities,
                flags = {
                    debounce_text_changes = 150,
                },
                settings = lsp_settings,
            }
        end
    end
}
