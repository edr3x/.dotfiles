return {
    'edr3x/better-escape.nvim',
    config = function()
        require("better_escape").setup {
            mapping = { "jk", "kj", "JK", "KJ", "jK", "kJ", "Jk", "Kj" },
            timeout = vim.o.timeoutlen,
            clear_empty_lines = false,
            keys = "<Esc>",
        }
    end
}
