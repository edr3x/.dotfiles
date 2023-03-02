return {
    "goolord/alpha-nvim",
    config = function()
        local dashboard = require "alpha.themes.dashboard"
        local btn = dashboard.button
        local section = dashboard.section

        section.header.val = {
            [[                                                 ]],
            [[                                                 ]],
            [[                                                 ]],
            [[                                                 ]],
            [[                                                 ]],
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
            [[                                                 ]],
            [[                                                 ]],
        }

        section.buttons.val = {
            btn("o", " " .. " Current Session", "<cmd>lua require('persistence').load()<CR>"),
            btn("t", " " .. " File Tree", "<cmd>NvimTreeToggle<CR>"),
            btn("n", " " .. " New File", "<CMD>ene!<CR>"),
            btn("r", " " .. " Last Session", "<cmd>lua require('persistence').load({ last = true })<CR>"),
            btn("c", " " .. " Config", "<CMD>cd $HOME/.config/nvim | Telescope find_files<CR>"),
            btn("q", " " .. " Quit", "<cmd>qa<CR>"),
        }

        section.footer.val = "㠪ᗪ 尺㇌乂"

        section.footer.opts.hl = "Type"
        section.header.opts.hl = "Include"
        section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true

        require("alpha").setup(dashboard.opts)
    end
}
