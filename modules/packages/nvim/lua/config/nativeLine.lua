function _G.MyStatusLine()
	local mode = "%-5{mode()}"
	local filename = "%f"
	local modified = "%m"
	local readonly = "%r"
	local align = "%="
	local filetype = "%Y"
	local percentage = "%3p%%"
	local line_col = "%l:%c"

	local diagnostics = ""
	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	if errors > 0 then
		diagnostics = " %#ErrorMsg#● " .. errors .. " "
	end

	return string.format(
		" %%#StatusLine# %s │ %s%s%s %s%s %%#StatusLineNC# %s │ %s │ %s ",
		mode,
		filename,
		modified,
		readonly,
		diagnostics,
		align,
		filetype,
		percentage,
		line_col
	)
end

vim.opt.statusline = "%!v:lua.MyStatusLine()"
