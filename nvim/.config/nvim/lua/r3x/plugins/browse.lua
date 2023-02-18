return {
    "lalitmee/browse.nvim",
    keys   = {
        { "<leader>fs", function() require('browse').input_search() end, desc = "Google Search" }
    },
    config = function()
        require("browse").setup({
            provider = "google",
        })
    end
}
