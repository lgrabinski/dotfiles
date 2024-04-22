return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    -- For snip users
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
},
config = function()
  require('cmp').setup {
    sources = {
      { name = 'path' },
      { name = 'nvim_lsp', keyword_length = 1 },
      { name = 'buffer', keyword_length = 3 },
    }
  }
end
}

