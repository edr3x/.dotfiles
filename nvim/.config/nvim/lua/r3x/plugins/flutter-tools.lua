return {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    config = function()
        require("flutter-tools").setup({
            debugger = {
                enabled = false,
                run_via_dap = false,
            },
            outline = { auto_open = false },
            decorations = {
                statusline = { device = true, app_version = true },
            },
            widget_guides = { enabled = true, debug = false },
            dev_log = { enabled = true, open_cmd = "tabedit" },
            lsp = {
                on_attach = require("r3x.plugins.lsp.settings").on_attach,
                capabilities = require("r3x.plugins.lsp.settings").capabilities,
                color = {
                    enabled = true,
                    background = true,
                    virtual_text = true,
                },
                settings = {
                    showTodos = false,
                    renameFilesWithClasses = "prompt",
                    updateImportsOnRename = true,
                    completeFunctionCalls = true,
                    lineLength = 100,
                },
            },
        })
        require("telescope").load_extension("flutter")
    end,
}
