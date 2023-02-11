return {
    'jose-elias-alvarez/null-ls.nvim',
    ft = "typescript",
    config = function()
        local null_ls = require("null-ls")

        local formatting = null_ls.builtins.formatting

        null_ls.setup {
            debug = false,
            sources = {
                formatting.prettierd.with({
                    disabled_filetypes = { "markdown", "yaml" },
                }),
                require("typescript.extensions.null-ls.code-actions"),
            },
        }
    end
}
