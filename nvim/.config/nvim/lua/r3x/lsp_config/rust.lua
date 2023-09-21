return {
    ["rust-analyzer"] = { --TODO: `rustup component add rust-analyzer` to install LSP
        procMacro = { enable = true },
        cargo = { allFeatures = true },
        checkOnSave = true,
        check = {
            command = "clippy", --TODO: `rustup component add clippy` to install clippy
            extraArgs = { "--no-deps" },
        },
    },
}
