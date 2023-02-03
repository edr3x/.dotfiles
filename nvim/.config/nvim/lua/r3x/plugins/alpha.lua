return {
    "goolord/alpha-nvim",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local status_ok, alpha = pcall(require, "alpha")
        if not status_ok then
            return
        end

        local dashboard = require "alpha.themes.dashboard"
        local config_dir = "<cmd>silent !tmux neww tmux-sessionizer ~/.dotfiles/nvim/.config/nvim<CR>"

        local dashboard_nvim = {
            [[                                                 ]],
            [[                                                 ]],
            [[                                                 ]],
            [[ ███╗  ██╗███████╗ █████╗ ██╗   ██╗██╗███╗   ███╗]],
            [[ ████╗ ██║██╔════╝██╔══██╗██║   ██║██║████╗ ████║]],
            [[ ██╔██╗██║█████╗  ██║  ██║╚██╗ ██╔╝██║██╔████╔██║]],
            [[ ██║╚████║██╔══╝  ██║  ██║ ╚████╔╝ ██║██║╚██╔╝██║]],
            [[ ██║ ╚███║███████╗╚█████╔╝  ╚██╔╝  ██║██║ ╚═╝ ██║]],
            [[ ╚═╝  ╚══╝╚══════╝ ╚════╝    ╚═╝   ╚═╝╚═╝     ╚═╝]],
            [[                                                 ]],
            [[                                                 ]],
        }

        dashboard.section.header.val = dashboard_nvim

        dashboard.section.buttons.val = {
            dashboard.button("f", " " .. " Find file", "<cmd>Telescope find_files <CR>"),
            dashboard.button("t", " " .. " File Tree", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("p", " " .. " Browse Projects", "<cmd>silent !tmux neww tmux-sessionizer<CR>"),
            dashboard.button("r", " " .. " Recent files", "<cmd>Telescope oldfiles <CR>"),
            dashboard.button("g", " " .. " Git Diff View", "<cmd>DiffviewOpen <CR>"),
            dashboard.button("x", " " .. " Find text", "<cmd>Telescope live_grep <CR>"),
            dashboard.button("c", " " .. " Config", config_dir),
            dashboard.button("q", " " .. " Quit", "<cmd>qa<CR>"),
        }

        dashboard.section.footer.val = "㠪ᗪ 尺㇌乂"

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true

        alpha.setup(dashboard.opts)

    end
}
