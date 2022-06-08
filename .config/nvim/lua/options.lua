local options = {
	fileencoding = "utf-8",
	number = true,
	relativenumber = true,
	cursorline = true,
	syntax = enable,
	scrolloff = 8,
	backspace = indent,eol,start,  --
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	autoindent = true,
    termguicolors = true,          -- needed for palenight theme
    mouse = "a",                   -- enable mouse for all modes
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
