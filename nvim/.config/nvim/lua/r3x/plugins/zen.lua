return {
    "folke/zen-mode.nvim",
    event = "BufReadPre",
    opts = {
        plugins = {
            options = {
                enabled = true,
                ruler = true,
                showcmd = false,
            },
            gitsigns = { enabled = false },
            tmux = { enabled = true },
        },
    },
    keys = {
        {
            "<leader>zz",
            function()
                require("zen-mode").toggle({
                    window = {
                        width = 0.60,
                    },
                })
            end,
            desc = "Zen mode",
        },
    },
}
