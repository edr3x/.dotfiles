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
            root_folder_modifier = ":~",
            indent_markers = {
                enable = true,
            },
            icons = {
                glyphs = {
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
            special_files = {
                "Cargo.toml",
                "Makefile",
                "README.md",
                "go.mod",
            },
        },
        filters = {
            dotfiles = true,
            custom = { 'node_modules' },
        },
        actions = {
            use_system_clipboard = true,
        },
        modified = {
            enable = true,
        },
        diagnostics = {
            enable = true,
            show_on_dirs = false,
            debounce_delay = 450,
            icons = {
                error = "",
                warning = "",
                hint = "",
                info = "",
            },
        },
    }
}
