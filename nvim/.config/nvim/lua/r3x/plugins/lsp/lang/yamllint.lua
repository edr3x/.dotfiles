return {
    "-d",
    [[
        {
            extends: relaxed,
            rules: {
                line-length: disable,
                comments-indentation: disable,
                indentation: {
                    spaces: 2
                }
            }
        }
    ]],
    "--format",
    "parsable",
    "-",
}
