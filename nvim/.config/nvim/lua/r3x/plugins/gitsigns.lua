return {
    'lewis6991/gitsigns.nvim',
    event = "BufReadPre",
    keys = {
        { "gn",         "<cmd>Gitsigns next_hunk<CR>" },
        { "gN",         "<cmd>Gitsigns prev_hunk<CR>" },
        { "<leader>gb", "<cmd>Gitsigns blame_line<CR>" },
        { "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<CR>" },
        { "<leader>gd", "<cmd>Gitsigns toggle_deleted<CR>" },
        { "<leader>gw", "<cmd>Gitsigns toggle_word_diff<CR>" },
    },
    opts = {
        signs = {
            untracked    = { text = 'U' },
            add          = { text = "A" },
            change       = { text = "M" },
            delete       = { text = "D" },
            topdelete    = { text = "D" },
            changedelete = { text = "D" },
        },
    }
}
