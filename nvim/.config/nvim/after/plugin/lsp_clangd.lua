local lsp_status, lspconfig = pcall(require, "lspconfig")
if not lsp_status then
    vim.notify("Lspconfig not found")
    return
end

lspconfig.clangd.setup({
    on_attach = require("r3x.plugins.lsp.settings").on_attach,
    capabilities = require("r3x.plugins.lsp.settings").capabilities,
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
})
