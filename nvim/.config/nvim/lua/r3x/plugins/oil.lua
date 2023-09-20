return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {
        delete_to_trash = true,
        default_file_explorer = false,
        skip_confirm_for_simple_edits = true,
        view_options = { show_hidden = true },
        keymaps = {
            ["<C-v>"] = "actions.select_vsplit",
            ["<C-x>"] = "actions.select_split",
            ["<A-w>"] = "actions.preview",
            ["<A-d>"] = "actions.close",
        },
    },
}
