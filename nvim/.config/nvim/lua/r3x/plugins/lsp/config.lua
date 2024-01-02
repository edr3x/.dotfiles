return function()
    require("neodev").setup()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    local lsp_conf = require("r3x.plugins.lsp.settings")

    local servers = {
        prismals = {},
        dockerls = {},
        pyright = {},
        svelte = {},
        -- tailwindcss = {},
        gopls = lsp_conf.go,
        cssls = lsp_conf.css,
        lua_ls = lsp_conf.lua,
        yamlls = lsp_conf.yaml,
        tsserver = lsp_conf.ts,
        rust_analyzer = lsp_conf.rust,
        html = { filetypes = { "html", "hbs" } },
        terraformls = { filetypes = { "terraform", "tf" } },
    }

    mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
    })

    mason_lspconfig.setup_handlers({
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = lsp_conf.on_attach,
                capabilities = lsp_conf.capabilities,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes,
            })
        end,
    })

    lspconfig.clangd.setup({
        on_attach = require("r3x.plugins.lsp.settings").on_attach,
        capabilities = require("r3x.plugins.lsp.settings").capabilities,
        cmd = {
            "clangd",
            "--offset-encoding=utf-16",
        },
    })

    require("illuminate").configure({
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
            providers = { "lsp" },
        },
    })

    require("r3x.plugins.lsp.handlers").setup()
end
