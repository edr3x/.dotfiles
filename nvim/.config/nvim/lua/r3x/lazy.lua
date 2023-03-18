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

local plugins = {
    { import = "r3x.plugins" },
}

local opts = {
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "man",
                "matchit",
                "netrwPlugin",
                "rplugin",
                "shada",
                "spellfile",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
}

require("lazy").setup(plugins, opts)
