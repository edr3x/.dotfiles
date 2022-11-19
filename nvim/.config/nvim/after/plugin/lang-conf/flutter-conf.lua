local status, ftools = pcall(require, "flutter-tools")
if not status then
    return
end

ftools.setup {
    debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
    },
    outline = { auto_open = false },
    decorations = {
        statusline = { device = true, app_version = true },
    },
    widget_guides = { enabled = true, debug = false },
    dev_log = { enabled = false, open_cmd = 'tabedit' },
    lsp = {
        on_attach = require('r3x.lsp-handlers').on_attach,
        color = {
            enabled = true,
            background = true,
            virtual_text = true,
        },
        settings = {
            showTodos = false,
            renameFilesWithClasses = 'prompt',
            updateImportsOnRename = true,
            completeFunctionCalls = true,
            lineLength = 100,
        },
    },
}
