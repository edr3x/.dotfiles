local M = {}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = " " },
        { name = "DiagnosticSignWarn", text = " " },
        { name = "DiagnosticSignHint", text = " " },
        { name = "DiagnosticSignInfo", text = " " },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, {
            texthl = sign.name,
            text = sign.text,
            numhl = "",
        })
    end

    vim.diagnostic.config({
        virtual_text = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = true,
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = "Hint",
        },
        update_in_insert = true,
    })

    vim.keymap.set("n", "dn", vim.diagnostic.goto_next)
    vim.keymap.set("n", "dN", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

    vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            vim.highlight.on_yank({
                higroup = "IncSearch", -- see `:highlight` for more options
                timeout = 200,
            })
        end,
    })

    -- ignore some filetypes on format on save
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
            if vim.bo.filetype == "html" then
                return
            end

            -- format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end,
    })

    -- inlay hints
    if vim.lsp.inlay_hint then
        vim.keymap.set("n", "<leader>lh", function()
            vim.lsp.inlay_hint(0, nil)
        end, { desc = "Toggle inlay hints" })
    end

    vim.cmd([[autocmd FileType * set formatoptions-=ro]])
end

return M
