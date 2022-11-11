local status, tokyonight = pcall(require, "tokyonight")
if not status then
    return
end

tokyonight.setup({
    style = "night",
    transparent = true,
    terminal_colors = true,
    styles = {
        comments = "italic",
        keywords = "italic",
        functions = "NONE",
        variables = "NONE",
        sidebars = "transparent",
        floats = "transparent",
    },
})

vim.cmd [[colorscheme tokyonight]]
