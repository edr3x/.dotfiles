return {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPre",
    conifg = function()
        ---@diagnostic disable
        require("ts_context_commentstring").setup({
            enable = true,
            enable_autocmd = false,
        })
    end,
}
