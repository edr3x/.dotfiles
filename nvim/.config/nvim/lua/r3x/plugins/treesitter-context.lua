return {
    'edr3x/nvim-treesitter-context',
    event = "BufReadPre",
    config = function()
        require("treesitter-context").setup {
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
    end
}
