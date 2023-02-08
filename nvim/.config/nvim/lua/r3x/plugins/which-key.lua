return {
    "folke/which-key.nvim",
    event = "BufReadPre",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require("which-key")

        wk.setup({})
        wk.register({
            c = { name = "Code Actions", },
            b = { name = "Buffer" },
            d = { name = "LSP diganostics" },
            f = { name = "Telescope" },
            g = { name = "Git" },
            m = { name = "Minimap and md" },
            n = { name = "Tree prefix", t = "tree" },
            s = { name = "Search and replace current highlight" },
            t = { name = "Trouble" }
        }, { prefix = "<leader>" })
    end
}
