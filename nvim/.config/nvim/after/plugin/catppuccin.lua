vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
    transparent_background = true,
    term_colors = true,
    compile = {
        enabled = false,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    highlight_overrides = {},
})

--vim.cmd [[colorscheme catppuccin]]
