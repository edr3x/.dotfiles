local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

local lang = require("r3x.plugins.lsp.lang")
local opts = require("r3x.plugins.lsp.opts")

local servers = {
    -- prismals = {},
    dockerls = {},
    bufls = {},
    gopls = lang.go,
    lua_ls = lang.lua,
    yamlls = lang.yaml,
    tsserver = lang.ts,
    rust_analyzer = lang.rust,
    terraformls = { filetypes = { "terraform", "tf" } },
}

mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        })
    end,
})

-- lspconfig.clangd.setup({
--     on_attach = opts.on_attach,
--     capabilities = opts.capabilities,
--     cmd = {
--         "clangd",
--         "--offset-encoding=utf-16",
--     },
-- })
