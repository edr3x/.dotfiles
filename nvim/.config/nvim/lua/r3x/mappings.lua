local map = vim.keymap.set
local options = { noremap = true, silent = true }

vim.g.mapleader = ','

map('n', '<leader>ntt', '<cmd>NvimTreeToggle<CR>', options)
map('n', '<leader>h', '<cmd>bprev<CR>', options) -- go back a file
map('n', '<leader>l', '<cmd>bnext<CR>', options) -- go back a file
map('n', '<S-j>', '<cmd>m+<CR>', options) -- move line down
map('n', '<S-k>', '<cmd>m-2<CR>', options) -- move line up
map('n', '<leader><ESC>', '<cmd>qa<CR>', options)
map('x', '<leader>cc', '"+y', options) -- copy to system clipboard
map('n', '<leader>p', '"*p', options) -- paste for emoji

--telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', options)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', options)
map('n', '<leader>fe', '<cmd>Telescope emoji<CR>', options)
map('n', '<leader>sd', '<cmd>Telescope flutter commands<CR>', options)

--harpoon
map('n', "<leader>a", function() require("harpoon.mark").add_file() end, options)
map('n', "<leader>o", function() require("harpoon.ui").toggle_quick_menu() end, options)
map('n', "<leader>k", function() require("harpoon.ui").nav_prev() end, options)
map('n', "<leader>j", function() require("harpoon.ui").nav_next() end, options)

map('n', "<leader>1", function() require("harpoon.ui").nav_file(1) end, options)
map('n', "<leader>2", function() require("harpoon.ui").nav_file(2) end, options)
map('n', "<leader>3", function() require("harpoon.ui").nav_file(3) end, options)
map('n', "<leader>4", function() require("harpoon.ui").nav_file(4) end, options)
map('n', "<leader>5", function() require("harpoon.ui").nav_file(5) end, options)

--md prev
map('n', "<leader>md", function() require('peek').open() end, options)
map('n', "<leader>mc", function() require('peek').close() end, options)

--lsp buffer
map({ 'x', 'n' }, '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', options)
map('n', '<leader>df', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
map('n', '<leader>de', '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
map('n', '<leader>im', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
map('n', '<leader>rf', '<cmd>lua vim.lsp.buf.reference()<CR>', options)
map('n', '<leader>t', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
map('n', '<C-.>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
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
