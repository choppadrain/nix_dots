return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = { "nix", "go", "lua", "yaml", "typst", "nu", "toml", "json" },
			auto_install = true,
		})
	end,
}
