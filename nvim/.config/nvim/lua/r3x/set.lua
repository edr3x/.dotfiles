local set = vim.opt

vim.g.mapleader = ","
vim.g.maplocalleader = ","

set.nu = true
set.relativenumber = true

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.hlsearch = false
set.incsearch = true
set.scrolloff = 15

set.splitbelow = true
set.splitright = true
set.signcolumn = "yes"
set.showmode = false

set.timeout = true
set.timeoutlen = 200

set.smartindent = true
set.wrap = false
set.termguicolors = true
set.list = false

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true
set.undolevels = 10000

vim.g.markdown_recommended_style = 0
