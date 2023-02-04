return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        vim.keymap.set({ 'n', 'x' }, '<leader>bt', "<cmd>lua require('barbecue.ui').toggle()<cr>")
    },
}
