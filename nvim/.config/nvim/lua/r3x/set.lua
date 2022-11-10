local set = vim.opt
local ncmd = vim.api.nvim_command

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
set.termguicolors = true
set.list = true
set.iskeyword:append("-")
set.backspace = "indent,eol,start"

ncmd("sign define DiagnosticSignError text= texthl=DiagnosticSignError")
ncmd("sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn")
ncmd("sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo")
ncmd("sign define DiagnosticSignHint text= texthl=DiagnosticSignHint")

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
