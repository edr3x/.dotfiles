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
}
