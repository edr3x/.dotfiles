return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'Telescope find_files' },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<CR>' },
        { '<leader>ff', '<cmd>Telescope find_files<CR>' },
        { '<leader>fg', '<cmd>Telescope live_grep<CR>' },
        { '<leader>fb', '<cmd>Telescope buffers<CR>' },
        { '<leader>ft', '<cmd>Telescope treesitter<CR>' },
        { '<leader>sd', '<cmd>Telescope flutter commands<CR>' },
        { "<leader>gs", "<cmd>Telescope git_status<CR>" },
        { "<leader>gt", "<cmd>Telescope git_branches<CR>" },
    },
    config = function()
        local scope = require("telescope")
        local tactions = require("telescope.actions")
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
                    i = { ["<esc>"] = tactions.close },
                    n = {
                        ["<esc>"] = tactions.close,
                        ["dd"] = "delete_buffer",
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
