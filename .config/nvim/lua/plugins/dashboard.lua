return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      hide = {
        statusline = false,
      },
      config = {
        center = {
          {
            icon = '',
            icon_hl = 'group',
            desc = 'description',
            desc_hl = 'group',
            key = 'shortcut key in dashboard buffer not keymap !!',
            key_hl = 'group',
            action = '',
          },
        },
        footer = {},
      }
    }
  end,
}
