require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "%.git$", "%.git[/\\]", "node_modules", "target", "build", "ios", "android", "linux",
            "macos", "web", "windows", "%.lock$" },
        color_devicons = true,
    }
}

require("telescope").load_extension "flutter"
require('telescope').load_extension('dap')
