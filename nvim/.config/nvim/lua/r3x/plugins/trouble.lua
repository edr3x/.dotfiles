return {
    'folke/trouble.nvim',
    event = "BufReadPre",
    keys = {
        { "<leader>tt", "<cmd>TroubleToggle<cr>" },
        { "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
        { "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>" },
        { "<leader>dr", "<cmd>TroubleToggle lsp_references<cr>",       desc = "References" }
    }
}
