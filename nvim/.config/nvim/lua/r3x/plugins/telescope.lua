return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Telescope find_files" },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find texts" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "List Opened Buffers" },
        { "<leader>ft", "<cmd>Telescope treesitter<CR>", desc = "List Treesitter Variables" },
        { "<leader>fc", "<cmd>Telescope flutter commands<CR>", desc = "Flutter Commands" },
        { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Git status" },
        { "<leader>gt", "<cmd>Telescope git_branches<CR>", desc = "Git branches" },
    },
    opts = {
        defaults = {
            file_ignore_patterns = {
                "%.git$",
                "%.git[/\\]",
                "node_modules",
                "target",
                "build",
                "ios",
                "android",
                "linux",
                "macos",
                "web",
                "windows",
                "%.lock$",
            },
            color_devicons = true,
            mappings = {
                n = {
                    ["dd"] = "delete_buffer",
                },
            },
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.60,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.92,
                height = 0.87,
                preview_cutoff = 0,
            },
            path_display = { "smart", shorten = { len = 3 } },
            dynamic_preview_title = true,
            wrap_results = true,
        },
        pickers = {
            find_files = { hidden = true },
            live_grep = {
                additional_args = function()
                    return { "--hidden" }
                end,
            },
        },
    },
}
