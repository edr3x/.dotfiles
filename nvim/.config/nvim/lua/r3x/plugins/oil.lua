return {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {
        delete_to_trash = true,
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,
        view_options = { show_hidden = true },
        keymaps = {
            ["<C-s>"] = false,
            ["<C-h>"] = false,
            ["<C-l>"] = false,
            ["<A-d>"] = "actions.close",
            ["<A-w>"] = "actions.preview",
            ["<C-x>"] = "actions.select_split",
            ["<C-v>"] = "actions.select_vsplit",
        },
    },
}
