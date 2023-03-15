return {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = {
        tools = {
            autoSetHints = true,
            inlay_hints = {
                auto = true,
                only_current_line = false,
                only_current_line_autocmd = "CursorHold",
                show_parameter_hints = true,
                show_variable_name = false,
                parameter_hints_prefix = "<- ",
                other_hints_prefix = "=> ",
                max_len_align = false,
                max_len_align_padding = 1,
                right_align = false,
                right_align_padding = 7,
                highlight = "Comment",
            },
        },
        server = {
            standalone = true,
            on_attach = require("r3x.handlers").on_attach,
            capabilities = require("r3x.handlers").capabilities,
        },
    },
}
