local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.api.nvim_create_user_command("E", "Oil", { desc = "Open Oil instead of NetRW" })

-- center screen
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "G", "Gzzzv", opts)

-- remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- remove mapping
map({ "n", "x" }, "Q", "<nop>")

-- because im lazy
map({ "n", "v" }, "<S-h>", "^", opts)
map({ "n", "v" }, "<S-l>", "$", opts)
map("n", "<leader><ESC>", "<cmd>qa<CR>", opts)

-- move code up and down
map("n", "<M-j>", ":m+<CR>", opts) -- move line down
map("n", "<M-k>", ":m-2<CR>", opts) -- move line up
map("x", "<M-j>", ":m '>+1<CR>gv=gv", opts) -- move code block down
map("x", "<M-k>", ":m '<-2<CR>gv=gv", opts) -- move code block up

-- better indents
map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)

-- buffer
map("n", "<M-h>", "<cmd>bprev<CR>", opts)
map("n", "<M-l>", "<cmd>bnext<CR>", opts)
-- map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
map("n", "<leader>ba", "<cmd>%bd|e#<cr>", { desc = "Close all buffers but not current one" })

-- avoid vim register for some operations
map("n", "x", [["_x]], opts)
map("x", "p", [["_dP]], opts)
map("n", "<leader>Y", [["+Y]], opts) -- copy current line to system clipboard
map("n", "<leader>vp", "`[v`]", opts) -- reselect pasted text
map({ "n", "x" }, "<leader>y", [["+y]], opts) -- copy to system clipboard
map({ "n", "x" }, "<leader>p", [["+p]], opts) -- paste from system clipboard
map("n", "YY", "va{Vy", opts)

-- split resize
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- split navigation(commented couz of tmux-vim-navigator plugin)
-- map("n", "<C-h>", "<C-w>h", opts)
-- map("n", "<C-j>", "<C-w>j", opts)
-- map("n", "<C-k>", "<C-w>k", opts)
-- map("n", "<C-l>", "<C-w>l", opts)

-- term mode
map("t", "<esc>", "<C-\\><C-n>", opts) -- go back to normal mode with <esc> on terminal mode

-- search and replace
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
