local status, scope = pcall(require, "telescope")
if not status then
    return
end

local stat, tactions = pcall(require, "telescope.actions")
if not stat then
    return
end

scope.setup {
    defaults = {
        file_ignore_patterns = { "%.git$", "%.git[/\\]", "node_modules", "target", "build", "ios", "android", "linux",
            "macos", "web", "windows", "%.lock$" },
        color_devicons = true,
        mappings = {
            i = { ["<esc>"] = tactions.close },
            n = { ["<esc>"] = tactions.close },
        },
    },
    pickers = {
        find_files = {
            hidden = true
        }
    }
}

scope.load_extension('flutter')
scope.load_extension('harpoon')
scope.load_extension('dap')
scope.load_extension('emoji')
