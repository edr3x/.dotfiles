return {
    {
        "tpope/vim-commentary",
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
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
        },
    },
    {
        "stevearc/dressing.nvim",
        event = "BufReadPre",
        config = true,
    },
}
