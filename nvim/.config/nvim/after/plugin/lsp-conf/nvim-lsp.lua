local status, mason = pcall(require, "mason")
if not status then
    return
end

local stat, masonlsp = pcall(require, "mason-lspconfig")
if not stat then
    return
end

local sta, lspconf = pcall(require, "lspconfig")
if not sta then
    return
end

local servers = {
    'clangd',
    'sumneko_lua',
    'tsserver',
    'emmet_ls',
    'jsonls',
    'gopls',
    'prismals',
    'rust_analyzer',
    'pyright',
    'marksman',
    'yamlls',
    'dockerls',
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
                    globals = { 'vim' }
                }
            }
        }
    }
end
