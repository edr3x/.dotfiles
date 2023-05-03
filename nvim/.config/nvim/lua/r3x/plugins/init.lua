return {
    {
        "tpope/vim-commentary",
        event = "BufReadPre",
    },
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git" },
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
        "kylechui/nvim-surround",
        event = "BufReadPre",
        version = "*",
        opts = {},
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
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
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
        },
    },
}
