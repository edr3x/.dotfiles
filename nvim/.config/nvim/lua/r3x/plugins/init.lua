return {
    {
        "tpope/vim-commentary",
        event = "BufReadPre",
    },
    {
        "github/copilot.vim",
        event = "InsertEnter",
    },
    {
        "andweeb/presence.nvim",
        event = "BufReadPre",
    },
    {
        "edr3x/better-escape.nvim",
        event = "BufReadPre",
        opts = {
            mapping = { "jk", "kj", "JK", "KJ", "jK", "kJ", "Jk", "Kj" },
            timeout = vim.o.timeoutlen,
            clear_empty_lines = false,
            keys = "<Esc>",
        },
    },
    {
        "folke/persistence.nvim",
        lazy = false,
        opts = {},
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
        },
    },
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git" },
    },
}
