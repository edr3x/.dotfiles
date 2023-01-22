local status, gitsigns = pcall(require, "gitsigns")
if not status then
    return
end

gitsigns.setup({
    signs = {
        untracked    = { text = 'U' },
        add          = { text = "A" },
        change       = { text = "M" },
        delete       = { text = "D" },
        topdelete    = { text = "D" },
        changedelete = { text = "D" },
    },
})
