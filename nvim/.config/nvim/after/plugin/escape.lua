local status, esc = pcall(require, "better_escape")
if not status then
    return
end

esc.setup {
    mapping = { "jk", "kj", "JK", "KJ", "jK", "kJ", "Jk", "Kj" },
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false,
    keys = "<Esc>",
}
