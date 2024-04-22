return {
  'nvim-telescope/telescope.nvim',
	dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons',
  },
	config = function()
		local builtin = require('telescope.builtin')
		-- Files
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})

		-- Help
		vim.keymap.set('n', '<leader>hk', builtin.keymaps, {})
		vim.keymap.set('n', '<leader>hh', builtin.help_tags, {})

		-- Buffers
		vim.keymap.set('n', '<leader>bb', builtin.buffers, {})

		-- Search
		vim.keymap.set('n', '<leader>ss', builtin.live_grep, {})
	end
}
