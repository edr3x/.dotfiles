return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'Telescope find_files' },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<CR>',       desc = "Find Files" },
        { '<leader>fg', '<cmd>Telescope live_grep<CR>',        desc = "Find texts" },
        { '<leader>fb', '<cmd>Telescope buffers<CR>',          desc = "List Opened Buffers" },
        { '<leader>ft', '<cmd>Telescope treesitter<CR>',       desc = "List Treesitter Variables" },
        { '<leader>fc', '<cmd>Telescope flutter commands<CR>', desc = "Flutter Commands" },
        { "<leader>gs", "<cmd>Telescope git_status<CR>",       desc = "Git status" },
        { "<leader>gt", "<cmd>Telescope git_branches<CR>",     desc = "Git branches" },
    },
    config = function()
        local scope = require("telescope")
        local tactions = require("telescope.actions")
        local trouble = require("trouble.providers.telescope")
        scope.setup {
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
                    "%.lock$"
                },
                color_devicons = true,
                mappings = {
                    i = {
                        ["<esc>"] = tactions.close,
                        ["<c-t>"] = trouble.open_with_trouble
                    },
                    n = {
                        ["<esc>"] = tactions.close,
                        ["dd"] = "delete_buffer",
                        ["<c-t>"] = trouble.open_with_trouble
                    },
                },
                layout_strategy = 'vertical',
                layout_config = { height = 0.95, preview_height = 0.6, preview_cutoff = 0 },
                path_display = { "smart", shorten = { len = 3 } },
                dynamic_preview_title = true,
                wrap_results = true,
            },
            pickers = {
                find_files = { hidden = true },
                live_grep = { additional_args = function() return { "--hidden" } end },
            },
        }
    end
}
