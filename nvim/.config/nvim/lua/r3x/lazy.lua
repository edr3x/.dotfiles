local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local opts = {
    defaults = {
        version = "*",
    },
    install = {
        missing = true,
        colorscheme = { "Tokyonight" },
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            reset = true,
            paths = {}, -- add any custom paths here that you want to includes in the rtp
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
}

require('lazy').setup('r3x.plugins', opts)
