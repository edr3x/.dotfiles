return {
    gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        gofumpt = true,
        staticcheck = true,
        analyses = {
            unusedparams = true,
        },
    },
}
