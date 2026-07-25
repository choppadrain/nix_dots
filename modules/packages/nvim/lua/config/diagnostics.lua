vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = "4    ",
		source = "always",
		severity = { min = vim.diagnostic.severity.HINT },
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "●",
			[vim.diagnostic.severity.WARN] = "●",
			[vim.diagnostic.severity.INFO] = "●",
			[vim.diagnostic.severity.HINT] = "●",
		},
	},
})
