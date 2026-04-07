vim.diagnostic.config{
    virtual_text = {
        prefix = '●',
        spacing = '4',
        source = "always",
        severity = { min = vim.diagnostic.severity.HINT },
    },
}
