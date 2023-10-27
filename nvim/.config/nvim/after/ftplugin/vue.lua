require("lspconfig")["volar"].setup({
    on_attach = require("r3x.plugins.lsp.settings").on_attach,
    capabilities = require("r3x.plugins.lsp.settings").capabilities,
    filetypes = {
        "typescript",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
        "json",
    },
    settings = {
        volar = {
            codeLens = {
                references = true,
                pugTools = true,
                scriptSetupTools = true,
            },
        },
    },
})
