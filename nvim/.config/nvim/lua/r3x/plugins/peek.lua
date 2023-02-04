return {
    'toppair/peek.nvim',
    ft = 'markdown',
    build = 'deno task --quiet build:fast',
    commit = "18284b64f6c5103ccf18d6b53f288d2b2de2dc4a",
    config = function()
        local peek = require("peek")
        local opts = require("r3x.handlers").opts
        vim.keymap.set('n', "<leader>md", function() peek.open() end, opts)
        vim.keymap.set('n', "<leader>mc", function() peek.close() end, opts)
    end
}
