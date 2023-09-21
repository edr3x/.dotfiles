return {
    cmd = { "rustup", "run", "stable", "rust-analyzer" }, --TODO: `rustup component add rust-analyzer` to install LSP
    ["rust-analyzer"] = {
        procMacro = { enable = true },
        cargo = { allFeatures = true },
        checkOnSave = true,
        check = {
            command = "clippy", --TODO: `rustup component add clippy` to install clippy
            extraArgs = { "--no-deps" },
        },
    },
}
