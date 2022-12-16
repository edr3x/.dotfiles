local map = vim.keymap.set
local options = { noremap = true, silent = true }

local harpoon_ui_status, hook = pcall(require, "harpoon.ui")
if not harpoon_ui_status then
    return
end

local harpoon_mark_status, mark = pcall(require, "harpoon.mark")
if not harpoon_mark_status then
    return
end

local peek_status, peek = pcall(require, "peek")
if not peek_status then
    return
end

vim.g.mapleader = ','

map('n', 'x', '"_x', options)
map('n', 'c', '"_c', options)
map('n', '<C-d>', '<C-d>zz', options)
map('n', '<C-u>', '<C-u>zz', options)
map('n', 'n', 'nzz', options)
map('n', 'N', 'Nzz', options)
map('n', 'G', 'Gzz', options)
map({ 'n', 'x' }, '<S-h>', '^', options)
map({ 'n', 'x' }, '<S-l>', '$', options)
map({ 'v', 'x' }, '<M-j>', "<cmd>m '>+1<cr>gv=gv", options) -- move code block down
map({ 'v', 'x' }, '<M-k>', "<cmd>m '<-2<cr>gv=gv", options) -- move code block up
map('n', '<M-j>', '<cmd>m+<CR>', options) -- move line down
map('n', '<M-k>', '<cmd>m-2<CR>', options) -- move line up
map('n', '<C-a>', 'ggVG', options) -- select all
map('n', '<leader>ntt', '<cmd>NvimTreeToggle<CR>', options)
map('n', '<leader>h', '<cmd>bprev<CR>', options) -- go back a file
map('n', '<leader>l', '<cmd>bnext<CR>', options) -- go back a file
map('n', '<leader><ESC>', '<cmd>qa<CR>', options)
map('x', '<leader>cc', '"+y', options) -- copy to system clipboard
map('n', '<leader>p', '"*p', options) -- paste for emoji

--errors
map('n', '<leader>cf', '<cmd>TroubleToggle quickfix<cr>', options)

--telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', options)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', options)
map('n', '<leader>ft', '<cmd>Telescope treesitter<CR>', options)
map('n', '<leader>fe', '<cmd>Telescope emoji<CR>', options)
map('n', '<leader>sd', '<cmd>Telescope flutter commands<CR>', options)

--harpoon
map('n', "<leader>a", function() mark.add_file() end, options)
map('n', "<leader>o", function() hook.toggle_quick_menu() end, options)
map('n', "<leader>k", function() hook.nav_prev() end, options)
map('n', "<leader>j", function() hook.nav_next() end, options)

map('n', "<leader>1", function() hook.nav_file(1) end, options)
map('n', "<leader>2", function() hook.nav_file(2) end, options)
map('n', "<leader>3", function() hook.nav_file(3) end, options)
map('n', "<leader>4", function() hook.nav_file(4) end, options)
map('n', "<leader>5", function() hook.nav_file(5) end, options)

--md prev
map('n', "<leader>md", function() peek.open() end, options)
map('n', "<leader>mc", function() peek.close() end, options)

--[[

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
map("n", "<leader>dg", ":lua require'dap-go'.debug_test()<CR>", options)

]] --
