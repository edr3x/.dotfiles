local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lsp_status, masonlsp = pcall(require, "mason-lspconfig")
if not mason_lsp_status then
    return
end

local lsp_status, lspconf = pcall(require, "lspconfig")
if not lsp_status then
    return
end

local servers = {
    'clangd',
    'sumneko_lua',
    'tsserver',
    'bashls',
    'gopls',
    'prismals',
    'rust_analyzer',
    'pyright',
    'yamlls',
    'dockerls',
    'graphql',
    'tailwindcss',
    'cssls',
    'jdtls',
}

mason.setup {
    ui = {
        border = "none",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

masonlsp.setup {
    ensure_installed = servers,
    automatic_installation = true,
}

for _, lsp in pairs(servers) do
    lspconf[lsp].setup {
        on_attach = require("r3x.lsp-handlers").on_attach,
        capabilities = require("r3x.lsp-handlers").capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim', 'awesome', 'client' }
                }
            }
        }
    }
end
