return {
    {
        'tpope/vim-commentary',
        event = "BufReadPre",
    },
    {
        'github/copilot.vim',
        event = "InsertEnter",
    },
    {
        'andweeb/presence.nvim',
        event = "BufReadPre",
    },
    {
        "folke/persistence.nvim",
        lazy = false,
        opts = {},
    },
    {
        'mbbill/undotree',
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
        },
    },
    {
        'tpope/vim-fugitive',
        cmd = { 'G', 'Git' },
    },
    {
        'ThePrimeagen/vim-be-good',
        cmd = "VimBeGood",
    },
    {
        'Eandrju/cellular-automaton.nvim',
        cmd = "CellularAutomaton",
    },
    {
        "lalitmee/browse.nvim",
        keys = {
            { "<leader>fs", function() require('browse').input_search() end, desc = "Google Search" }
        },
        opts = { provider = "google" }
    },
    {
        'ggandor/leap.nvim',
        cmd = "Leap",
        config = function()
            require("leap").add_default_mappings()
        end
    }
}
