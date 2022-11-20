require("todo-comments").setup {
    keywords = {
        FIX = {
            icon = " ",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "myth" },
        },
        TODO = { icon = " ", color = "#FF8C00" },
        HACK = { icon = " ", color = "#3498DB" },
        WARN = { icon = " ", color = "#FF2D00", alt = { "WARNING", "XXX", "!" } },
        NOTE = { icon = " ", color = "#98C379", alt = { "INFO", "*" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    highlight = { pattern = [[(KEYWORDS)]] },
}

--!  this is the warning
--myth  this is mythical code so proceed with caution
--*  this should be noted with care
