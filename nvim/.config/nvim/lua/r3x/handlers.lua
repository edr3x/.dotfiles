local M = {}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
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

    vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            vim.highlight.on_yank({
                higroup = "IncSearch", -- see `:highlight` for more options
                timeout = 200,
            })
        end,
    })

    vim.api.nvim_create_user_command("Fmt", function()
        vim.lsp.buf.format()
    end, {})

    -- format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
            vim.lsp.buf.format()
        end,
    })

    vim.cmd([[autocmd FileType * set formatoptions-=ro]])
end

local opts = { noremap = true, silent = true }

local signature_cfg = {
    bind = true,
    hint_enable = false,
    floating_window = true,
    floating_window_above_cur_line = true,
    check_completion_visible = true,
    toggle_key = "<M-t>",
    select_signature_key = "<M-s>",
    handler_opts = {
        border = "rounded",
    },
}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
    end

    if client.name == "lua_ls" then
        client.server_capabilities.documentFormattingProvider = false
    end

    client.server_capabilities.semanticTokensProvider = nil

    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>de", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>df", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>di", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>h", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "dn", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "dN", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts)

    require("illuminate").on_attach(client)

    require("lsp_signature").on_attach(signature_cfg, bufnr)
end

return M
