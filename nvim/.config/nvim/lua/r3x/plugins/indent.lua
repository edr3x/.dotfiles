return {
    "lukas-reineke/indent-blankline.nvim",
    ft = { "yaml" },
    opts = {
        char = "┊",
        use_treesitter = true,
        space_char_blankline = " ",
        show_current_context = false,
        show_current_context_start = false,
        buftype_exclude = { "nofile", "terminal" },
    },
}
