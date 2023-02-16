require("lspconfig").lua_ls.setup {
    on_attach = require("r3x.handlers").on_attach,
    capabilities = require("r3x.handlers").capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'awesome', 'client' }
            }
        }
    },
}
