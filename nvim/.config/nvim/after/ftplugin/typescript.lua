require("lspconfig").tsserver.setup {
    -- cmd = { "bun", "run", "--bun", "typescript-language-server", "--stdio" } -- if lsp in Mason
    cmd = { "typescript-language-server", "--stdio" }, -- global install via `bun add --global typescript-language-server`
    on_attach = require("r3x.handlers").on_attach,
    capabilities = require("r3x.handlers").capabilities,
}
