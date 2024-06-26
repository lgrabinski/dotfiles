return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = { 
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly needed, but recommended
		"MunifTanjim/nui.nvim",
	},
  config = function()
    vim.keymap.set('n', '<leader>at', ':Neotree<CR>', {})
  end
}
