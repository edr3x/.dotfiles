return {
    "edr3x/better-escape.nvim",
    event = "BufReadPre",
    opts = {
        mapping = { "jk", "kj", "JK", "KJ", "jK", "kJ", "Jk", "Kj" },
        timeout = vim.o.timeoutlen,
        clear_empty_lines = false,
        keys = "<Esc>",
    },
}
