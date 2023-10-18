return {
    "famiu/bufdelete.nvim",
    keys = {
        {
            "<leader>bd",
            function()
                require("bufdelete").bufdelete(0, true)
            end,
            desc = "Delete buffer",
        },
    },
}
