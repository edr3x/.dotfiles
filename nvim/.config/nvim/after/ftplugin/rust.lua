local status, rust_tools = pcall(require, "rust-tools")
if not status then
    return
end

local opts = {
    server = {
        on_attach = require("r3x.lsp-handlers").on_attach,
        standalone = false,
    },
}

rust_tools.setup(opts)
rust_tools.inlay_hints.enable()
