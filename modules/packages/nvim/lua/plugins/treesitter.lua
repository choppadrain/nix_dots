return {
	"nvim-treesitter",
	lazy = false,

	after = function()
		require("nvim-treesitter").setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
			indent = { enable = true },
		})
	end,
}
