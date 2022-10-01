require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "lua",
        "rust",
        "go",
        "typescript",
        "javascript",
        "prisma",
        "python",
        "dart",
    },
    sync_install = false,
    ignore_install = { "javascript" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
            "#a89984",
            "#b16286",
            "#d79921",
            "#689d6a",
            "#d65d0e",
            "#458588",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
    }
}
