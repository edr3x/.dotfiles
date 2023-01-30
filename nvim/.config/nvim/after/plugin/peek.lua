local peek_status, peek = pcall(require, "peek")
if not peek_status then
    return
end

vim.keymap.set('n', "<leader>md", function() peek.open() end, { noremap = true, silent = true })
vim.keymap.set('n', "<leader>mc", function() peek.close() end, { noremap = true, silent = true })
