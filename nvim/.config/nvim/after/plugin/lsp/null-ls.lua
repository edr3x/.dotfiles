local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting

null_ls.setup {
    debug = false,
    sources = {
        formatting.prettierd.with({
            disabled_filetypes = { "markdown" },
        }),
        formatting.google_java_format,
    },
}
