local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
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

    -- stylua: ignore start
    local trouble = require("trouble").toggle
    nmap("<leader>tt", function() trouble() end, "Toggle Trouble")
    nmap("<leader>tq", function() trouble("quickfix") end, "Quickfix List")
    nmap("<leader>dr", function() trouble("lsp_references") end, "References")
    nmap("<leader>dd", function() trouble("document_diagnostics") end, "Document Diagnostics")
    nmap("<leader>dw", function() trouble("workspace_diagnostics") end, "Workspace Diagnostics")
    -- stylua: ignore end

    nmap("<leader>ds", "<cmd>vs | lua vim.lsp.buf.definition()<cr>", "Goto definition (v-split)")
    nmap("<leader>dh", "<cmd>sp | lua vim.lsp.buf.definition()<cr>", "Goto definition (h-split)")

    vim.keymap.set("i", "<M-t>", vim.lsp.buf.signature_help, { buffer = bufnr })

    vim.api.nvim_buf_create_user_command(bufnr, "Fmt", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })

    require("illuminate").configure({
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
            providers = { "lsp" },
        },
    })

    require("illuminate").on_attach(client)
end

return M
