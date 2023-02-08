return {
    'toppair/peek.nvim',
    ft = 'markdown',
    build = 'deno task --quiet build:fast',
    commit = "18284b64f6c5103ccf18d6b53f288d2b2de2dc4a",
    keys = {
        { "<leader>md", function() require("peek").open() end,  desc = "Open markdown preview" },
        { "<leader>mc", function() require("peek").close() end, desc = "Close markdown preview" },
    },
}
