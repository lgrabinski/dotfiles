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
    {
     'L3MON4D3/LuaSnip',
     build = (function()
       if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
         return
       end
       return 'make install_jsregexp'
     end)(),
  }
},

config  = function()
  local cmp = require 'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'buffer' },
      { name = 'orgmode' },
    }),
    mapping = cmp.mapping.preset.insert({
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-y>'] = cmp.mapping.confirm ({ select = true }),
    })
  })
end
}
