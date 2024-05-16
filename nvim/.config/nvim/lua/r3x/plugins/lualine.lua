return {
    "edr3x/lualine.nvim",
    opts = function()
        local lspStatus = {
            function()
                local msg = "No LSP detected"
                local buf_ft = vim.api.nvim_get_option_value("filetype", {})
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = "",
            color = { fg = "#d3d3d3" },
        }

        local buffer = {
            "buffers",
            mode = 0,
            show_filename_only = true,
            show_modified_status = true,
            hide_filename_extension = false,
            symbols = { alternate_file = "" },
            buffers_color = {
                active = { fg = "#d3d3d3" },
                inactive = { fg = "#414141" },
            },
        }

        local diagnostic = {
            "diagnostics",
            symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = " ",
            },
            icon = "|",
        }

        local diff = {
            "diff",
            symbols = {
                added = " ",
                modified = " ",
                removed = " ",
            },
        }

        return {
            options = {
                icons_enabled = true,
                theme = "custom_transparent",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = { "alpha", "dashboard", "lazy" },
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { buffer },
                lualine_x = { diff, diagnostic },
                lualine_y = { lspStatus, "filetype", "location" },
                lualine_z = { "progress" },
            },
        }
    end,
}
