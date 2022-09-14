local servers = { 'clangd', 'sumneko_lua', 'tsserver', 'emmet_ls', 'jsonls', 'gopls', 'prismals', 'rust_analyzer',
    'pyright', 'marksman' }
require("nvim-lsp-installer").setup({
    ensure_installed = servers,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }
end
