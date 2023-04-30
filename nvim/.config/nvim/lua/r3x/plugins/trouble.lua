return {
    {
        "folke/trouble.nvim",
        event = "BufReadPre",
        keys = {
            { "<leader>tt", "<cmd>TroubleToggle<cr>", desc = "Toggle Diagnostics" },
            { "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
            { "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Current Buffer Diagnostics" },
            { "<leader>dr", "<cmd>TroubleToggle lsp_references<cr>", desc = "References" },
            { "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", desc = "Open quickfix List" },
        },
        opts = {},
    },
    {
        "edr3x/lsp_lines.nvim",
        keys = {
            {
                "<leader>l",
                function()
                    require("lsp_lines").toggle()
                end,
                desc = "Toggle lsp_lines",
            },
        },
        opts = {},
    },
}
