local map = vim.keymap.set
local options = { noremap = true, silent = true }

vim.g.mapleader = ','

map('n', 'ff', ':Telescope find_files<cr>', options)
map('n', '<leader>ntt', ':NvimTreeToggle<CR>', options)
map('n', '<leader>b', ':bprev<CR>', options)
map('n', '<leader>sd', ':Telescope flutter commands<CR>', options)

map('x', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', options)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', options)
map('n', '<leader>df', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
map('n', '<leader>de', '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
map('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
map('n', '<leader>rf', '<cmd>lua vim.lsp.buf.reference()<CR>', options)
map('n', '<leader>t', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
map('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', options)
map('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_next()<CR>', options)

--debugger
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", options)
map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", options)
map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", options)
map("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", options)
map("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", options)
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", options)
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", options)
map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", options)
map("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", options)

--debug for go
map("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")
