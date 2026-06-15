return {
	"lualine.nvim",
	event = "DefferedUiEnter",
	after = function()
		require("lualine").setup({
			options = {},
		})
	end,
}
