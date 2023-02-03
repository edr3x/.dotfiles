return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require("gitsigns").setup {
            signs = {
                untracked    = { text = 'U' },
                add          = { text = "A" },
                change       = { text = "M" },
                delete       = { text = "D" },
                topdelete    = { text = "D" },
                changedelete = { text = "D" },
            },
        }
    end
}
