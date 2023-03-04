local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
    vim.notify "cmp_nvim_lsp plugin not found"
    return
end

local signature_status, lsp_signature = pcall(require, "lsp_signature")
if not signature_status then
    vim.notify "lsp_signature plugin not found"
    return
end

local illuminate_status, illuminate = pcall(require, "illuminate")
if not illuminate_status then
    vim.notify "illuminate plugin not found"
    return
end

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn",  text = "" },
        { name = "DiagnosticSignHint",  text = "" },
        { name = "DiagnosticSignInfo",  text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(
            sign.name,
            {
                texthl = sign.name,
                text = sign.text,
                numhl = "",
            }
        )
    end

    vim.diagnostic.config({
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

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
            underline = true,
            virtual_text = {
                spacing = 5,
                severity_limit = 'Warning',
            },
            update_in_insert = true,
        }
    )

    vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            vim.highlight.on_yank({
                higroup = "IncSearch", -- see `:highlight` for more options
                timeout = 200
            })
        end,
    })

    -- format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
            vim.lsp.buf.format()
        end,
    })

    vim.cmd [[autocmd FileType * set formatoptions-=ro]]
end

local options = { noremap = true, silent = true }
local keymap = vim.api.nvim_buf_set_keymap

local lsp_keymaps = function(bufnr)
    keymap(bufnr, "n", "<leader>de", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
    keymap(bufnr, "n", "<leader>df", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
    keymap(bufnr, "n", "<leader>di", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
    keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
    keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
    keymap(bufnr, "n", "<leader>h", "<cmd>lua vim.lsp.buf.signature_help()<CR>", options)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", options)

    keymap(bufnr, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", options)
    keymap(bufnr, "n", "dn", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", options)
    keymap(bufnr, "n", "dN", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", options)
end

local signature_cfg = {
    bind = true,
    hint_enable = false,
    floating_window = true,
    floating_window_above_cur_line = true,
    check_completion_visible = true,
    toggle_key = '<M-t>',
    select_signature_key = '<M-s>',
    handler_opts = {
        border = "rounded"
    }
}

M.capabilities = cmp_nvim_lsp.default_capabilities()

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
    end

    client.server_capabilities.semanticTokensProvider = nil

    lsp_keymaps(bufnr)

    illuminate.on_attach(client)

    lsp_signature.on_attach(signature_cfg, bufnr)
end

return M
