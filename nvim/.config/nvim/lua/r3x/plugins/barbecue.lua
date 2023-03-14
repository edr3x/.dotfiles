return {
    "utilyre/barbecue.nvim",
    event = "BufReadPre",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { '<leader>bt', "<cmd>lua require('barbecue.ui').toggle()<cr>" }
    },
    opts = {
        kinds = {
            File = "",
            Module = "",
            Namespace = "n",
            Package = "",
            Class = "ﴯ",
            Method = "m",
            Property = "",
            Field = "",
            Constructor = "",
            Enum = "",
            Interface = "",
            Function = "",
            Variable = "",
            Constant = "",
            String = "",
            Number = "",
            Boolean = "",
            Array = "",
            Object = "",
            Key = "",
            Null = "",
            EnumMember = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
        },
    }
}
