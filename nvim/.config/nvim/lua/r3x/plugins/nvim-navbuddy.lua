return {
    "SmiteshP/nvim-navbuddy",
    event = "LspAttach",
    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {
            "<leader>lt",
            function()
                require("nvim-navbuddy").open()
            end,
            desc = "Navbuddy open",
        },
    },
    opts = {
        window = {
            border = "rounded",
            size = "80%",
            position = "50%",
        },
        icons = {
            File = "󰈙 ",
            Module = " ",
            Namespace = " ",
            Package = " ",
            Class = "󰠱 ",
            Method = "󰊕 ",
            Property = "󰜢 ",
            Field = "󰇽 ",
            Constructor = " ",
            Enum = " ",
            Interface = " ",
            Function = "󰊕 ",
            Variable = "󰂡 ",
            Constant = "󰏿 ",
            String = " ",
            Number = " ",
            Boolean = " ",
            Array = " ",
            Object = " ",
            Key = " ",
            Null = "󰟢 ",
            EnumMember = " ",
            Struct = "󰠱 ",
            Event = " ",
            Operator = " ",
            TypeParameter = " ",
        },
    },
}
