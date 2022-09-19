require("flutter-tools").setup {
    debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
        register_configurations = function(_)
            require("dap").configurations.dart = {
                type = "dart",
                request = "launch",
                name = "Launch Flutter Program",
                program = "${file}",
                cwd = "${workspaceFolder}",
                toolArgs = { "-d", "linux" }
            }
            require("dap.ext.vscode").load_launchjs()
        end,
    },
    dev_log = {
        enabled = true,
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
