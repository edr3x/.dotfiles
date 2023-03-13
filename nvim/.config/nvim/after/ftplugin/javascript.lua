require("lspconfig").tsserver.setup {
    cmd = { "typescript-language-server", "--stdio" },
    on_attach = require("r3x.handlers").on_attach,
    capabilities = require("r3x.handlers").capabilities,
}
