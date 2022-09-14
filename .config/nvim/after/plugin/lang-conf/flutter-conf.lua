require("flutter-tools").setup {
    debugger = {
        enabled = true,
        run_via_dap = true,
    },
    outline = { auto_open = false },
    decorations = {
        statusline = { device = true, app_version = true },
    },
    widget_guides = {
        enabled = true,
    },
    lsp = {
        color = {
            enabled = true,
            background = true,
            virtual_text = false,
        },
        settings = {
            showTodos = true,
            renameFilesWithClasses = "prompt",
        },
    },
}
