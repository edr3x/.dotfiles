return {
    gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        gofumpt = true,
        staticcheck = true,
        analyses = {
            unusedparams = true,
        },
        hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
        },
    },
}
