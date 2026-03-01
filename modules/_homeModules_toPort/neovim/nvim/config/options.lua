vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true

vim.o.wrap = true

vim.o.signcolumn = "yes"

vim.o.winborder = "rounded"

vim.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.o.swapfile = false

--sync clipboard with os
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

--keybinds
vim.keymap.set("n", "<leader>w", ":write<CR>")
