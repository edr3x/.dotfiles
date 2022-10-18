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
        "fish",
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
            "#00FFFF",
            "#BF40BF",
            "#FF00CD",
            "#66ff00"
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
