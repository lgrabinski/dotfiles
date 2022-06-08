vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })

map('n', '<leader>t', ':Telescope<CR>', { noremap = true, silent = false })
