local set = vim.opt

vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.g.markdown_recommended_style = 0

set.nu = true
set.relativenumber = true

set.tabstop = 4
set.scrolloff = 15
set.shiftwidth = 4
set.softtabstop = 4
set.hlsearch = false
set.expandtab = true
set.incsearch = true

set.showmode = false
set.splitbelow = true
set.splitright = true
set.cursorline = true
set.signcolumn = "yes"

-- Case-insensitive searching UNLESS \C or capital in search
set.smartcase = true
set.ignorecase = true

set.timeout = true
set.updatetime = 300
set.timeoutlen = 300

-- Better completion experience
set.completeopt = "menuone,noselect"

set.wrap = false
set.list = false
set.smartindent = true
set.termguicolors = true

set.backup = false
set.undofile = true
set.swapfile = false
set.undolevels = 10000
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
