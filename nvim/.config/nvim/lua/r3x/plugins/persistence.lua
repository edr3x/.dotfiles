return {
    "folke/persistence.nvim",
    lazy = false,
    config = function()
        require("persistence").setup()

        local cmd = vim.api.nvim_create_user_command
        cmd('SLoad', 'lua require("persistence").load()', {})
        cmd('SLast', 'lua require("persistence").load({ last = true })', {})
        cmd('SStop', 'lua require("persistence").stop()', {})
    end,
}
