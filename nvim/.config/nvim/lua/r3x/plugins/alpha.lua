return {
    "goolord/alpha-nvim",
    config = function()
        local dashboard = require("alpha.themes.dashboard")
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

        -- stylua: ignore
        section.buttons.val = {
            btn("o", " " .. " Current Session", "<cmd>lua require('persistence').load()<CR>"),
            btn("t", " " .. " File Explorer", "<cmd>Oil<CR>"),
            btn("f", " " .. " Find files", "<CMD>lua require('telescope.builtin').find_files()<CR>"),
            btn("n", " " .. " New File", "<CMD>ene!<CR>"),
            btn("r", " " .. " Last Session", "<cmd>lua require('persistence').load({ last = true })<CR>"),
            btn("c", " " .. " Config", "<CMD>cd $HOME/.config/nvim | lua require('telescope.builtin').find_files()<CR>"),
            btn("q", " " .. " Quit", "<cmd>qa<CR>"),
        }

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                section.footer.val = "⚡㠪ᗪ 尺㇌乂 " .. stats.count .. " plugins loaded in " .. ms .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })

        section.footer.opts.hl = "Type"
        section.header.opts.hl = "Include"
        section.buttons.opts.hl = "Keyword"

        require("alpha").setup(dashboard.opts)
    end,
}
