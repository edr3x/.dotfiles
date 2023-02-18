local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ','

-- center screen
map('n', 'D', '<C-d>zz', opts)
map('n', 'U', '<C-u>zz', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('n', 'G', 'Gzzzv', opts)

-- remove mapping
map('n', 'Q', '<nop>', opts)

-- because im lazy
map({ 'n', 'v' }, '<S-h>', '^', opts)
map({ 'n', 'v' }, '<S-l>', '$', opts)
map('n', '<C-a>', 'ggVG', opts)
map('n', '<leader><ESC>', '<cmd>qa<CR>', opts)

-- move code up and down
map('n', '<M-j>', ':m+<CR>', opts) -- move line down
map('n', '<M-k>', ':m-2<CR>', opts) -- move line up
map("x", "<M-j>", ":m '>+1<CR>gv=gv", opts) -- move code block down
map("x", "<M-k>", ":m '<-2<CR>gv=gv", opts) -- move code block up

-- better indents
map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)

-- buffer
map('n', '<M-h>', '<cmd>bprev<CR>', opts)
map('n', '<M-l>', '<cmd>bnext<CR>', opts)
map('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = "Close current buffer" })
map('n', '<leader>ba', '<cmd>%bd|e#<cr>', { desc = "Close all buffers but not current one" })

-- avoid vim register for some operations
map('n', 'x', '"_x', opts)
map("x", "p", '"_dP', opts)
map({ "n", "x" }, "<leader>y", '"+y', opts) -- copy to system clipboard
map({ "n", "x" }, "<leader>p", '"+p', opts) -- paste from system clipboard

-- split resize
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- split navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- search and replace
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
