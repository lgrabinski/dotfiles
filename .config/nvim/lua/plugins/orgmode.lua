return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    require('orgmode').setup ({
      org_agenda_files = '~/shared/notes/**/*',
      org_default_notes_files = '~/shared/test.org',
    })
    end
}
