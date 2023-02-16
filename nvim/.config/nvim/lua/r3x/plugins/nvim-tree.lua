return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    cmd = { 'NvimTreeToggle' },
    keys = {
        { '<leader>ntt', '<cmd>NvimTreeToggle<CR>' },
    },
    opts = {
        sort_by = "name",
        auto_reload_on_write = true,
        reload_on_bufenter = false,
        disable_netrw = true,
        hijack_netrw = true,
        view = {
            adaptive_size = true,
            width = 40,
            number = false,
            relativenumber = false,
            signcolumn = "yes",
            hide_root_folder = false,
            mappings = {
                list = {
                    { key = "u", action = "dir_up" },
                    { key = "U", action = "cd" },
                    { key = "d", action = "trash" },
                },
            },
            float = {
                enable = true,
                open_win_config = {
                    relative = "editor",
                    border = "rounded",
                    width = 120,
                    height = 35,
                    row = 5,
                    col = 75,
                },
            },
        },
        renderer = {
            add_trailing = false,
            group_empty = false,
            highlight_git = false,
            highlight_opened_files = "none",
            root_folder_modifier = ":~",
            indent_markers = {
                enable = true,
                icons = {
                    corner = "└ ",
                    edge = "│ ",
                    none = "  ",
                },
            },
            icons = {
                webdev_colors = true,
                git_placement = "before",
                padding = " ",
                symlink_arrow = " ➛ ",
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    folder = {
                        arrow_closed = "",
                        arrow_open = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "M",
                        staged = "A",
                        unmerged = "",
                        renamed = "R",
                        untracked = "U",
                        deleted = "D",
                        ignored = "I",
                    },
                },
            },
            special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "go.mod", "pubspec.yaml" },
        },
        filters = {
            dotfiles = true,
            custom = { 'node_modules' },
        },
        actions = {
            use_system_clipboard = true,
        },
        diagnostics = {
            enable = true,
            show_on_dirs = false,
            icons = {
                error = "",
                warning = "",
                hint = "",
                info = "",
            },
        },
    }
}
