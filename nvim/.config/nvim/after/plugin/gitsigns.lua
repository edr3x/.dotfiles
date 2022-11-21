local status, gitsigns = pcall(require, "gitsigns")
if not status then
    return
end

gitsigns.setup({
    signs = {
        add = { text = "★" },
        change = { text = "➜ " },
        delete = { text = " " },
        topdelete = { text = "‾" },
        changedelete = { text = "➜ " },
    },
})
