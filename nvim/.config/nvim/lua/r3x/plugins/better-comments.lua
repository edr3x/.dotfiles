return {
    'folke/todo-comments.nvim',
    keys = {
        { "tn", function() require("todo-comments").jump_next() end, desc = "next marked comment" },
        { "tN", function() require("todo-comments").jump_prev() end, desc = "prev marked comment" },
    },
    opts = {
        keywords = {
            FIX  = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "myth" } },
            TODO = { icon = " ", color = "#FF8C00" },
            HACK = { icon = " ", color = "#3498DB" },
            WARN = { icon = " ", color = "#FF2D00", alt = { "WARNING", "XXX" } },
            NOTE = { icon = " ", color = "#98C379", alt = { "INFO" } },
        },
        highlight = { pattern = [[(KEYWORDS)]] },
    }
}
