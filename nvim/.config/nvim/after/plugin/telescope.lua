local scope = require('telescope')
local esc = { ["<esc>"] = require('telescope.actions').close }

scope.setup {
    defaults = {
        file_ignore_patterns = { "%.git$", "%.git[/\\]", "node_modules", "target", "build", "ios", "android", "linux",
            "macos", "web", "windows", "%.lock$" },
        color_devicons = true,
        mappings = {
            i = esc,
            n = esc,
        },
    }
}

scope.load_extension('flutter')
scope.load_extension('harpoon')
scope.load_extension('dap')
scope.load_extension('emoji')
