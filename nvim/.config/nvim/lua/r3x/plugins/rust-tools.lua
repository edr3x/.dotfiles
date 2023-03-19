return {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = {
        server = {
            standalone = false,
            on_attach = require("r3x.handlers").on_attach,
            capabilities = require("r3x.handlers").capabilities,
            cmd = { "rustup", "run", "stable", "rust-analyzer" }, --TODO: `rustup component add rust-analyzer` to install LSP
        },
    },
}
