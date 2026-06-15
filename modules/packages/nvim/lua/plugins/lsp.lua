return {
	"nvim-lspconfig",
	lazy = false,
	after = function()
		--lua
		vim.lsp.config["lua_ls"] = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "require" },
					},
					runtime = {
						version = "LuaJIT",
					},
				},
			},
		}

		--typst
		vim.lsp.config["tinymist"] = {
			cmd = { "tinymist" },
			filetypes = { "typst" },
			root_markers = { ".git", ".typst" },
			settings = {
				formatterMode = "typstyle",
			},
		}

		--nix
		vim.lsp.config("nixd", {})

		--go
		vim.lsp.config["gopls"] = {
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_markers = { "go.work", "go.mod", ".git" },
			settings = {
				gopls = {
					gofumpt = true,
					staticcheck = true,
					usePlaceholders = true,
				},
			},
		}

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("tinymist")
		vim.lsp.enable("nixd")
		vim.lsp.enable("gopls")
	end,
}
