return {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
        local null_ls = require("null-ls")

        local formatting = null_ls.builtins.formatting

        null_ls.setup {
            debug = false,
            sources = {
                formatting.prettierd.with({
                    disabled_filetypes = { "markdown", "yaml" },
                }),
                formatting.google_java_format,
            },
        }
    end
}
