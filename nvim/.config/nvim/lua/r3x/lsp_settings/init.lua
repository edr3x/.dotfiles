local M = {}

-- language servers
M.ts = require("r3x.lsp_settings.ts")
M.go = require("r3x.lsp_settings.go")
M.css = require("r3x.lsp_settings.css")
M.lua = require("r3x.lsp_settings.lua")
M.rust = require("r3x.lsp_settings.rust")
M.yaml = require("r3x.lsp_settings.yaml")

-- Handlers
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

    -- format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
            vim.lsp.buf.format()
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

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
    end

    if client.name == "volar" then
        local active_clients = vim.lsp.get_active_clients()
        client.server_capabilities.documentFormattingProvider = false
        for _, client_ in pairs(active_clients) do
            -- prevent tsserver from starting if volar is already active
            if client_.name == "tsserver" then
                client_.stop()
            end
        end
    end

    if client.name == "lua_ls" then
        client.server_capabilities.documentFormattingProvider = false
    end

    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
    end

    nmap("K", vim.lsp.buf.hover, "Open hover")
    nmap("<leader>r", vim.lsp.buf.rename, "Rename")
    nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
    nmap("<leader>df", vim.lsp.buf.definition, "Goto definition")
    nmap("<leader>de", vim.lsp.buf.declaration, "Goto declaration")
    nmap("<leader>di", vim.lsp.buf.implementation, "Goto implementation")
    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document symbols")

    vim.keymap.set("i", "<M-t>", vim.lsp.buf.signature_help, { buffer = bufnr })

    vim.api.nvim_buf_create_user_command(bufnr, "Fmt", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })

    require("illuminate").on_attach(client)
end

return M
