return {
    "jose-elias-alvarez/typescript.nvim",
    ft = { "typescript", "typescriptreact", "javascript" },
    opts = {
        disable_commands = false,
        debug = false,
        go_to_source_definition = {
            fallback = true,
        },
        server = {
            on_attach = require("r3x.handlers").on_attach,
        },
    }
}
