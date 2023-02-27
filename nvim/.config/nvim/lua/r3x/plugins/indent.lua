return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    opts = {
        char = "┊",
        space_char_blankline = " ",
        show_current_context = false,
        show_current_context_start = false,
        filetype_exclude = {
            "vimwiki",
            "man",
            "diagnosticpopup",
            "lspinfo",
            "lazy",
            "checkhealth",
            "TelescopePrompt",
            "TelescopeResults",
            "",
        },
    }
}
