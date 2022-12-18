local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

local tcontext_status, tcontext = pcall(require, "treesitter-context")
if not tcontext_status then
    return
end

treesitter.setup {
    ensure_installed = { "bash", "c", "cpp", "css", "dart", "dockerfile", "fish", "go", "html", "java", "javascript",
        "json", "llvm", "lua", "make", "markdown", "prisma", "proto", "python", "rust", "scss", "sql", "toml", "tsx",
        "typescript", "yaml" },
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
            "#a89984",
            "#b16286",
            "#d79921",
            "#689d6a",
            "#d65d0e",
            "#458588",
        },
    },
}

tcontext.setup {
    enable = true,
    throttle = true,
    max_lines = 0,
    patterns = {
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
        },
        rust = {
            'impl_item',
            'loop_expression',
            'struct',
            'enum',
        },
        typescript = {
            "class_declaration",
            "abstract_class_declaration",
            "else_clause",
        },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },
}
