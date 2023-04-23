return {
    "akinsho/toggleterm.nvim",
    event = "BufReadPre",
    opts = {
        size = 15,
        open_mapping = [[<M-t>]],
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = "1",
        close_on_exit = false,
        start_in_insert = true,
        persist_size = true,
        direction = "float",
        float_opts = {
            border = "curved",
            winblend = 0,
        },
        highlights = {
            FloatBorder = {
                guifg = "#208397",
            },
        },
    },
}
