return {
    "folke/todo-comments.nvim",
    keys = {
        {
            "tn",
            function()
                require("todo-comments").jump_next()
            end,
            desc = "next marked comment",
        },
        {
            "tN",
            function()
                require("todo-comments").jump_prev()
            end,
            desc = "prev marked comment",
        },
        {
            "<leader>ft",
            ":TodoTelescope<CR>",
            desc = "search todo comments",
        },
    },
    opts = {
        keywords = {
            FIX = { icon = " ", color = "#FF2D00", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
            TODO = { icon = " ", color = "#FF8C00" },
            HACK = { icon = " ", color = "#3498DB", alt = { "MYTH" } },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            NOTE = { icon = " ", color = "#98C379", alt = { "INFO", "HINT" } },
        },
    },
}
