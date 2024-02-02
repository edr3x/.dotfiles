return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end or ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-textobjects",
        { "nvim-treesitter/nvim-treesitter-context", config = true },
    },
    ---@diagnostic disable
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
                "hcl",
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
                "query",
                "rust",
                "scss",
                "svelte",
                "sql",
                "terraform",
                "toml",
                "tsx",
                "typescript",
                "vimdoc",
                "vue",
                "yaml",
            },
            ignore_install = { "php" },
            sync_install = false,
            auto_install = false,
            autotag = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
            highlight = {
                enable = true,
                extended_mode = true,
                disable = function(_, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
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
            playground = {
                enable = true,
            },
            query_linter = {
                enable = true,
                use_virtual_text = true,
                lint_events = { "BufWrite", "CursorHold" },
            },
        })
    end,
}
