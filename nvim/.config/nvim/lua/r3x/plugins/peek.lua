return {
    "toppair/peek.nvim",
    ft = "markdown",
    build = "deno task --quiet build:fast",
    commit = "18284b64f6c5103ccf18d6b53f288d2b2de2dc4a",
    keys = {
        {
            "<leader>md",
            function()
                local peek = require("peek")
                if peek.is_open() then
                    peek.close()
                else
                    peek.open()
                end
            end,
            desc = "Markdown Preview",
        },
    },
}
