require("lspconfig").lua_ls.setup {
    on_attach = require("r3x.handlers").on_attach,
    capabilities = require("r3x.handlers").capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'awesome', 'client' }
            }
        }
    },
}
