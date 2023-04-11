return {
    "echasnovski/mini.nvim",
    event = "BufReadPre",
    keys = {
        { "<Leader>mf", "<cmd>lua MiniMap.toggle_focus()<CR>" },
        { "<Leader>mr", "<cmd>lua MiniMap.refresh()<CR>" },
        { "<Leader>mt", "<cmd>lua MiniMap.toggle()<CR>" },
    },
    config = function()
        local map = require("mini.map")
        map.setup({
            integrations = {
                map.gen_integration.builtin_search(),
                map.gen_integration.diagnostic(),
                map.gen_integration.gitsigns(),
            },
            symbols = {
                encode = {
                    " ",
                    "_",
                    "-",
                    "‾",
                    resolution = {
                        row = 1,
                        col = 2,
                    },
                },
                scroll_line = "▶",
                scroll_view = " ",
            },
            window = {
                focusable = false,
                side = "right",
                show_integration_count = false,
                width = 10,
                winblend = 0,
            },
        })
        vim.cmd([[:lua MiniMap.open()]])
        require("mini.surround").setup() -- select word and press `s`
    end,
}
