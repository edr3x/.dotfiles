return {
    {
        "williamboman/mason.nvim",
        event = "BufReadPre",
        opts = {
            ensure_installed = {
                "prettierd",
                "stylua",
            },
        },
    },
    {
        "RRethy/vim-illuminate",
        event = "BufReadPost",
        config = function()
            require("illuminate").configure({
                delay = 200,
                large_file_cutoff = 2000,
                large_file_overrides = {
                    providers = { "lsp" },
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "folke/neodev.nvim" },
        event = "BufReadPre",
        config = function()
            require("neodev").setup()
            local lspconfig = require("lspconfig")
            local on_attach = require("r3x.handlers").on_attach
            local capabilities = require("r3x.handlers").capabilities

            local servers = {
                "prismals",
                "dockerls",
                "pyright",
                -- "tailwindcss",
                "svelte",
            }

            for _, lsp in pairs(servers) do
                lspconfig[lsp].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end

            lspconfig["lua_ls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        hint = { enable = true },
                        telemetry = { enable = false },
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            })

            local function organize_imports()
                vim.lsp.buf.execute_command({
                    command = "_typescript.organizeImports",
                    arguments = {
                        vim.api.nvim_buf_get_name(0),
                    },
                })
            end

            lspconfig["tsserver"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    javascript = {
                        inlayHints = {
                            includeInlayEnumMemberValueHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                    typescript = {
                        inlayHints = {
                            includeInlayEnumMemberValueHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                },
                commands = {
                    OrganizeImports = {
                        organize_imports,
                        description = "Organize Imports",
                    },
                },
            })

            lspconfig["rust_analyzer"].setup({ --TODO: `rustup component add rust-analyzer` to install LSP
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        procMacro = { enable = true },
                        cargo = { allFeatures = true },
                        checkOnSave = true,
                        check = {
                            command = "clippy", --TODO: `rustup component add clippy` to install clippy
                            extraArgs = { "--no-deps" },
                        },
                    },
                },
            })

            lspconfig["gopls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        gofumpt = true,
                        staticcheck = true,
                        analyses = {
                            unusedparams = true,
                        },
                    },
                },
                flags = {
                    debounce_text_changes = 120,
                },
            })

            lspconfig["yamlls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    yaml = {
                        keyOrdering = false,
                        schemaStore = {
                            enable = true,
                            url = "https://www.schemastore.org/api/json/catalog.json",
                        },
                        schemas = {
                            kubernetes = "*.yaml",
                            ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                            ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                            ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "azure-pipelines.yml",
                            ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                            ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                            ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                            ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                            ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                            ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                            ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
                            ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
                            ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
                        },
                        format = { enabled = false },
                        validate = false,
                        completion = true,
                        hover = true,
                    },
                },
            })

            local cap = capabilities
            cap.offsetEncoding = "utf-8"
            lspconfig["clangd"].setup({
                on_attach = on_attach,
                capabilities = cap,
            })

            lspconfig["cssls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    css = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                    scss = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                    less = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                },
            })

            require("r3x.handlers").setup()
        end,
    },
    -- code formatters
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "LspAttach",
        config = function()
            local nls = require("null-ls")

            nls.setup({
                debug = false,
                sources = {
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.prettierd.with({
                        disabled_filetypes = { "markdown", "yaml" },
                    }),
                },
            })
        end,
    },
}
