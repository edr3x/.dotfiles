return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>a",
            function()
                require("harpoon.mark").add_file()
            end,
            desc = "Harpoon mark",
        },
        {
            "<leader>o",
            function()
                require("harpoon.ui").toggle_quick_menu()
            end,
            desc = "Harpoon open",
        },
        {
            "<leader>1",
            function()
                require("harpoon.ui").nav_file(1)
            end,
            desc = "Harpoon jump to file 1",
        },
        {
            "<leader>2",
            function()
                require("harpoon.ui").nav_file(2)
            end,
            desc = "Harpoon jump to file 2",
        },
        {
            "<leader>3",
            function()
                require("harpoon.ui").nav_file(3)
            end,
            desc = "Harpoon jump to file 3",
        },
        {
            "<leader>4",
            function()
                require("harpoon.ui").nav_file(4)
            end,
            desc = "Harpoon jump to file 4",
        },
        {
            "<leader>5",
            function()
                require("harpoon.ui").nav_file(5)
            end,
            desc = "Harpoon jump to file 5",
        },
    },
    config = function()
        require("telescope").load_extension("harpoon")
    end,
}
