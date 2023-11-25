return {
    "windwp/nvim-autopairs",
    event = "BufReadPre",
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true, -- treesitter integration
            disable_filetype = { "TelescopePrompt" },
            ts_config = {
                lua = { "string", "source" },
                javascript = { "string", "template_string" },
                java = false,
            },
            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                offset = 0, -- Offset from pattern match
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
            },
        })

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done({}))
    end,
}
