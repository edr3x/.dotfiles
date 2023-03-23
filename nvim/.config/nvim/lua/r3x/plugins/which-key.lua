return {
    "folke/which-key.nvim",
    event = "BufReadPre",
    config = function()
        -- disable hints for certain operators
        local presets = require("which-key.plugins.presets")
        presets.operators["v"] = nil
        presets.operators["c"] = nil
        presets.operators["d"] = nil
        presets.operators["y"] = nil

        local wk = require("which-key")

        wk.setup({})
        wk.register({
            ["1"] = "which_key_ignore",
            ["2"] = "which_key_ignore",
            ["3"] = "which_key_ignore",
            ["4"] = "which_key_ignore",
            ["5"] = "which_key_ignore",
            c = { name = "Code Actions" },
            b = { name = "Buffer" },
            d = { name = "LSP diganostics" },
            f = { name = "Telescope" },
            g = { name = "Git" },
            l = { name = "LSP" },
            m = { name = "Minimap and md" },
            n = { name = "Tree prefix", t = "tree" },
            s = { name = "Search and replace current highlight" },
            t = { name = "Trouble" },
        }, { prefix = "<leader>" })
    end,
}
