return {
    "hrsh7th/nvim-cmp",
    event = "LspAttach",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
        "js-everts/cmp-tailwind-colors",
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local kind_icons = {
            Text = "",
            Method = "m",
            Function = "󰊕",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Module = "",
            Property = " ",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "",
            Operator = "󰆕",
            TypeParameter = " ",
        }

        local borderstyle = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        }
        ---@diagnostic disable
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<M-o>"] = cmp.mapping.scroll_docs(4),
                ["<M-i>"] = cmp.mapping.scroll_docs(-4),
                ["<M-k>"] = cmp.mapping.select_prev_item(),
                ["<M-j>"] = cmp.mapping.select_next_item(),
                ["<C-Space>"] = cmp.mapping.complete({}),
                ["<C-e>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                ["<CR>"] = cmp.mapping.confirm({
                    select = true,
                    behavior = cmp.ConfirmBehavior.Replace,
                }),
            }),
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snip]",
                        buffer = "[Buff]",
                        path = "[Path]",
                    })[entry.source.name]

                    -- for tailwind colors
                    if vim_item.kind == "Color" then
                        vim_item = require("cmp-tailwind-colors").format(entry, vim_item)
                        if vim_item.kind ~= "Color" then
                            vim_item.menu = "Color"
                            return vim_item
                        end
                    end

                    -- for codeium
                    if vim_item.kind == "Codeium" then
                        vim_item.menu = "[󱚤 ]"
                        vim_item.kind = " "
                        return vim_item
                    end

                    vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                    return vim_item
                end,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "codeium" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),
            duplicates = {
                nvim_lsp = 1,
                luasnip = 1,
                buffer = 1,
                path = 1,
            },
            window = {
                completion = borderstyle,
                documentation = borderstyle,
            },
            experimental = {
                ghost_text = false,
                native_menu = false,
            },
        })

        require("luasnip/loaders/from_vscode").lazy_load({
            paths = vim.fn.stdpath("config") .. "/snippets",
        })
    end,
}
