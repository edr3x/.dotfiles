return {
    'ThePrimeagen/harpoon',
    lazy = true,
    config = function()
        local hook = require("harpoon.ui")
        local mark = require("harpoon.mark")

        local opts = require("r3x.handlers").opts

        vim.keymap.set('n', "<leader>a", function() mark.add_file() end, opts)
        vim.keymap.set('n', "<leader>o", function() hook.toggle_quick_menu() end, opts)

        vim.keymap.set('n', "<leader>1", function() hook.nav_file(1) end, opts)
        vim.keymap.set('n', "<leader>2", function() hook.nav_file(2) end, opts)
        vim.keymap.set('n', "<leader>3", function() hook.nav_file(3) end, opts)
        vim.keymap.set('n', "<leader>4", function() hook.nav_file(4) end, opts)
        vim.keymap.set('n', "<leader>5", function() hook.nav_file(5) end, opts)

        require("telescope").load_extension('harpoon')
    end
}
