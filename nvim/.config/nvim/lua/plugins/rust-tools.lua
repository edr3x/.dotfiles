return {
    'simrat39/rust-tools.nvim',
    config = function()
        local rtools = require("rust-tools")

        local opts = {
            tools = {
                autoSetHints = true,
                inlay_hints = {
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
                on_attach = require("r3x.lsp-handlers").on_attach,
                capabilities = require("r3x.lsp-handlers").capabilities,
            },
        }

        rtools.setup(opts)
        rtools.inlay_hints.enable()
    end
}
