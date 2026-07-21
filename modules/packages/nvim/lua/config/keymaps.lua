local map = vim.keymap.set

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear search highlights" })

--to edit all occcunces of word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })
-- fmt
map("n", "<leader>cf", function()
	require("conform").format()
end, { desc = "Format current file" })

--snacks picker
map("n", "<leader>ff", function()
	Snacks.picker.smart()
end, { desc = "Find files (Smart)" })

map("n", "<leader>fo", function()
	Snacks.picker.recent()
end, { desc = "Find recent files" })

map("n", "<leader>fg", function()
	Snacks.picker.grep()
end, { desc = "Grep text" })

map("n", "<leader>fu", function()
	Snacks.picker.undo()
end, { desc = "Undo history" })
