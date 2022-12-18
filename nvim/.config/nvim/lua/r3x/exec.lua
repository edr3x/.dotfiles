local lang_maps = {
    cpp = { build = "clang++ % -o %:r", exec = "./%:r" },
    c = { build = "clang % -o %:r", exec = "./%:r" },
    typescript = { build = "tsc %", exec = "ts-node %" },
    javascript = { exec = "node %" },
    python = { exec = "python %" },
    java = { build = "javac %", exec = "java %:r" },
    sh = { exec = "./%" },
    go = { exec = "go run %" },
    rust = { exec = "cargo run" },
}
for lang, data in pairs(lang_maps) do
    if data.build ~= nil then
        vim.api.nvim_create_autocmd(
            "FileType",
            { command = "nnoremap <leader>b :!" .. data.build .. "<CR>", pattern = lang }
        )
    end

    vim.api.nvim_create_autocmd(
        "FileType",
        { command = "nnoremap <leader>x :vsplit<CR>:terminal " .. data.exec .. "<CR>", pattern = lang }
    )
end
