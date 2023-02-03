return {
    'ThePrimeagen/harpoon',
    config = function()
        local hook = require("harpoon.ui")
        local mark = require("harpoon.mark")

        local opts = { noremap = true, silent = true }

        vim.keymap.set('n', "<leader>a", function() mark.add_file() end, opts)
        vim.keymap.set('n', "<leader>o", function() hook.toggle_quick_menu() end, opts)

        vim.keymap.set('n', "<leader>1", function() hook.nav_file(1) end, opts)
        vim.keymap.set('n', "<leader>2", function() hook.nav_file(2) end, opts)
        vim.keymap.set('n', "<leader>3", function() hook.nav_file(3) end, opts)
        vim.keymap.set('n', "<leader>4", function() hook.nav_file(4) end, opts)
        vim.keymap.set('n', "<leader>5", function() hook.nav_file(5) end, opts)
    end
}
