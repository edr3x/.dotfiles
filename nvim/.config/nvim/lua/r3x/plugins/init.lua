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
            timeout = 120,
            clear_empty_lines = false,
            keys = "<Esc>",
        },
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
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
    {
        "tpope/vim-surround",
        event = "BufReadPre",
    },
}
