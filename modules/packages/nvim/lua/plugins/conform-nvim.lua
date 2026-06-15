return {
	"conform.nvim",
	lazy = false,
	after = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "nixfmt" },
				go = { "gofumpt" },
			},
			format_on_save = {
				timeout = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
