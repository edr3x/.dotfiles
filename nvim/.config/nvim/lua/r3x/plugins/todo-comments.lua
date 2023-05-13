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
    },
    opts = {
        keywords = {
            FIX = { icon = " ", color = "#FF2D00", alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "bug" } },
            TODO = { icon = " ", color = "#FF8C00", alt = { "todo" } },
            HACK = { icon = " ", color = "#3498DB", alt = { "myth" } },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "warn" } },
            NOTE = { icon = " ", color = "#98C379", alt = { "INFO", "note", "info" } },
        },
    },
}
