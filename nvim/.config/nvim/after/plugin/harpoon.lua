local opts = { noremap = true, silent = true }

local harpoon_ui_status, hook = pcall(require, "harpoon.ui")
if not harpoon_ui_status then
    return
end

local harpoon_mark_status, mark = pcall(require, "harpoon.mark")
if not harpoon_mark_status then
    return
end

vim.keymap.set('n', "<leader>a", function() mark.add_file() end, opts)
vim.keymap.set('n', "<leader>o", function() hook.toggle_quick_menu() end, opts)

vim.keymap.set('n', "<leader>1", function() hook.nav_file(1) end, opts)
vim.keymap.set('n', "<leader>2", function() hook.nav_file(2) end, opts)
vim.keymap.set('n', "<leader>3", function() hook.nav_file(3) end, opts)
vim.keymap.set('n', "<leader>4", function() hook.nav_file(4) end, opts)
vim.keymap.set('n', "<leader>5", function() hook.nav_file(5) end, opts)
