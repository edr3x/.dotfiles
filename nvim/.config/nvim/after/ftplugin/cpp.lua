vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

require("lspconfig").clangd.setup {
    on_attach = require("r3x.handlers").on_attach,
    capabilities = require("r3x.handlers").capabilities,
}
