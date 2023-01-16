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

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_buf_set_keymap

local lsp_keymaps = function(bufnr)
    keymap(bufnr, "n", "<leader>de", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "<leader>df", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "<leader>im", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "<leader>fr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    keymap(bufnr, "n", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

    keymap(bufnr, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap(bufnr, "n", "<C-n>", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
    keymap(bufnr, "n", "<C-p>", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts)
end

local signature_cfg = {
    hint_enable = false,
    floating_window = true,
    check_completion_visible = true,
    toggle_key = '<M-t>',
    select_signature_key = '<M-s>',
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
