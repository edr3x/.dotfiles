local set = vim.opt

set.nu = true
set.relativenumber = true

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.hlsearch = false
set.incsearch = true

set.smartindent = true
set.wrap = false

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
