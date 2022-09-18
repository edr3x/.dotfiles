local map = vim.keymap.set
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

--debugger
map("n", "<F5>", ":lua require'dap'.continue()<CR>")
map("n", "<F3>", ":lua require'dap'.step_over()<CR>")
map("n", "<F2>", ":lua require'dap'.step_into()<CR>")
map("n", "<F12>", ":lua require'dap'.step_out()<CR>")
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")

--debug for go
map("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")
