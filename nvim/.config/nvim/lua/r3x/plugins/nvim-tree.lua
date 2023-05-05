return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle" },
    keys = {
        { "<leader>ntt", "<cmd>NvimTreeToggle<CR>" },
    },
    opts = function()
        local function on_attach(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)

            vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
            vim.keymap.set("n", "U", api.tree.change_root_to_node, opts("CD"))
            vim.keymap.set("n", "d", api.fs.trash, opts("Trash"))
        end
        return {
            on_attach = on_attach,
            view = {
                adaptive_size = true,
                width = 40,
                number = false,
                relativenumber = false,
                signcolumn = "yes",
                hide_root_folder = false,
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
                custom = { "node_modules", "^\\.git$" },
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
                    error = " ",
                    warning = " ",
                    hint = " ",
                    info = " ",
                },
            },
        }
    end,
}
