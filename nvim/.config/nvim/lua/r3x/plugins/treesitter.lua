return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPre",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end or ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag",
            "nvim-treesitter/playground",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "cpp",
                    "css",
                    "dart",
                    "dockerfile",
                    "fish",
                    "go",
                    "graphql",
                    "html",
                    "java",
                    "javascript",
                    "json",
                    "llvm",
                    "lua",
                    "make",
                    "markdown",
                    "prisma",
                    "proto",
                    "python",
                    "rust",
                    "scss",
                    "sql",
                    "toml",
                    "tsx",
                    "typescript",
                    "vimdoc",
                    "yaml",
                },
                autotag = { enable = true },
                auto_install = false,
                highlight = {
                    enable = true,
                    extended_mode = true,
                    additional_vim_regex_highlighting = false,
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<c-space>",
                        node_incremental = "<c-space>",
                        scope_incremental = "<c-s>",
                        node_decremental = "<c-backspace>",
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPre",
        opts = {},
    },
}
