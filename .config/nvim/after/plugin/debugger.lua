require("nvim-dap-virtual-text").setup()
require('dap-go').setup()
require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

--dart
--[[
dap.adapters.dart = {
    type = "executable",
    command = "node",
    args = { "/home/r3x/.dev/dart-code/Dart-Code/out/dist/debug.js", "flutter" }
}

dap.configurations.dart = {
    {
        type = "dart",
        request = "launch",
        name = "Launch flutter",
        dartSdkPath = os.getenv('HOME') .. "/.dev/flutter/bin/cache/dart-sdk/",
        flutterSdkPath = os.getenv('HOME') .. "/.dev/flutter",
        program = "${workspaceFolder}/lib/main.dart",
        cwd = "${workspaceFolder}",
    }
}

-- another try
dap.adapters.dart = {
    type = "executable",
    command = "flutter",
    args = { "debug_adapter" }
}
dap.configurations.dart = {
    {
        type = "dart",
        request = "launch",
        name = "Launch Flutter Program",
        program = "${file}",
        cwd = "${workspaceFolder}",
        toolArgs = { "-d", "linux" }
    }
}
]]
--
