return {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
        style = "night",
        transparent = true,
        terminal_colors = true,
        styles = {
            -- Value is any valid attr-list value for `:help nvim_set_hl`
            comments = { italic = true },
            keywords = { italic = false },
            functions = {},
            variables = {},
            sidebars = "transparent",
            floats = "transparent",
        },
        on_colors = function(colors)
            colors.border = "#208397"
        end,
        on_highlights = function(hl, c)
            hl.CursorLineNr = { fg = c.orange, bold = true }
            hl.LineNr = { fg = c.orange, bold = true }
            hl.LineNrAbove = { fg = c.fg_gutter }
            hl.LineNrBelow = { fg = c.fg_gutter }
        end,
    },
}
