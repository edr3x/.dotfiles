return {
    'folke/todo-comments.nvim',
    cmd = "TodoTelescope",
    config = function()
        local comments = require("todo-comments")
        local opts = require("r3x.handlers").opts

        comments.setup {
            keywords = {
                FIX  = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "myth" } },
                TODO = { icon = " ", color = "#FF8C00" },
                HACK = { icon = " ", color = "#3498DB" },
                WARN = { icon = " ", color = "#FF2D00", alt = { "WARNING", "XXX" } },
                NOTE = { icon = " ", color = "#98C379", alt = { "INFO" } },
            },
            highlight = { pattern = [[(KEYWORDS)]] },
        }

        vim.keymap.set("n", "tn", function() comments.jump_next() end, opts)
        vim.keymap.set("n", "tN", function() comments.jump_prev() end, opts)
    end
}