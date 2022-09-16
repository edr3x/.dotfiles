local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

vim.g.mapleader = ','

map('n', 'ff', ':Telescope find_files<cr>', options)
map('n', '<leader>ntt', ':NvimTreeToggle<CR>', options)

map('x', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', options)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', options)
map('n', '<leader>sd', ':Telescope flutter commands<cr>', options)
map("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
map("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
map("n", "<leader>gr", "<cmd>lua vim.lsp.buf.reference()<CR>", options)
map('n', '<leader>t', ':lua vim.lsp.buf.hover()<cr>', options)
map("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", options)
map("n", "<C-n>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", options)
map("n", "<C-p>", "<cmd>lua vim.diagnostic.goto_next()<CR>", options)
