return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    keys = {
        { "gn", "<cmd>Gitsigns next_hunk<CR>" },
        { "gN", "<cmd>Gitsigns prev_hunk<CR>" },
        { "<leader>gb", "<cmd>Gitsigns blame_line<CR>" },
        { "<leader>gd", "<cmd>Gitsigns toggle_deleted<CR>" },
        { "<leader>gw", "<cmd>Gitsigns toggle_word_diff<CR>" },
        { "<leader>go", "<cmd>Gitsigns<CR>", desc = "Git Options" },
        { "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<CR>" },
    },
    opts = {
        signs = {
            add = { text = " +" },
            change = { text = " " },
            delete = { text = " " },
            untracked = { text = "┆" },
            topdelete = { text = " " },
            changedelete = { text = " " },
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local vmap = function(keys, func, desc)
                if desc then
                    desc = "Git: " .. desc
                end
                local opts = { buffer = bufnr, noremap = true, silent = true, desc = desc }
                vim.keymap.set("v", keys, func, opts)
            end

            vmap("gs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "Stage Selected")

            vmap("gu", function()
                gs.undo_stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "Undo Staged")

            vmap("gr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "Reset Selected")
        end,
    },
}
