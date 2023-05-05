return {
    "utilyre/barbecue.nvim",
    event = "BufReadPre",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "<leader>bt",
            function()
                require("barbecue.ui").toggle()
            end,
            desc = "Toggle Barbecue",
        },
    },
    opts = {
        kinds = {
            File = "",
            Module = "",
            Namespace = "",
            Package = "",
            Class = "",
            Method = "m",
            Property = "",
            Field = "",
            Constructor = "",
            Enum = "",
            Interface = "",
            Function = "󰊕",
            Variable = "",
            Constant = "",
            String = "",
            Number = "",
            Boolean = "",
            Array = "",
            Object = "",
            Key = "󰌋",
            Null = "",
            EnumMember = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
        },
    },
}
