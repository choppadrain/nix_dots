return {
	"snacks.nvim",
	lazy = false,
	after = function()
		require("snacks").setup({
			indent = {
				priority = 1,
				enabled = true,
				animate = {
					enabled = false,
				},
			},
			animate = {
				enabled = false,
				duration = {
					step = 0,
					total = 0,
				},
			},
			input = { enabled = true },

			picker = {
				enabled = true,
				matcher = {
					fuzzy = true,
					smartcase = true,
					ignorecase = true,
					sort_empty = false,
					filename_bonus = true,
					file_pos = true,
					cwd_bonus = true,
					history_bonus = true,
				},
			},

			statuscolumn = {
				enabled = true,
				left = { "sign", "fold" },
				right = { "git", "fold" },

				git = {
					patterns = { "GitSign", "MiniDiffSign" },
				},
				refresh = 50,
			},
			words = {
				enabled = true,
			},
		})
	end,
}
