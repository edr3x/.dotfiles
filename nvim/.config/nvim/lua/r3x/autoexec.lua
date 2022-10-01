local grp = vim.api.nvim_create_augroup
local exec = vim.api.nvim_create_autocmd

grp('RestoreCursorShapeOnExit', { clear = true })

exec('VimLeave', {
    group = 'RestoreCursorShapeOnExit',
    command = 'set guicursor=a:ver20'
})
