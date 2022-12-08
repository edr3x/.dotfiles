local ncmd = vim.api.nvim_command

ncmd("sign define DiagnosticSignError text= texthl=DiagnosticSignError")
ncmd("sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn")
ncmd("sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo")
ncmd("sign define DiagnosticSignHint text= texthl=DiagnosticSignHint")

vim.diagnostic.config({
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
