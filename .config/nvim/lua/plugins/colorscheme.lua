return {
	{
		"catpuccin/nvim",
		lazy = false,
		name = catppuccin,
		priority = 1000,
		config = function()
		vim.cmd.colorscheme "catppuccing-mocha"
	end
	}
}
