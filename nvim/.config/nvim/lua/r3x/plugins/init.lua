return {
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git" },
    },
    -- {
    --     "Exafunction/codeium.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "hrsh7th/nvim-cmp",
    --     },
    --     opts = {},
    -- },
    {
        "andweeb/presence.nvim",
        event = "BufReadPre",
    },
    {
        "kylechui/nvim-surround",
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
