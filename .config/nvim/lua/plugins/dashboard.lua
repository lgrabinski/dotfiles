require("dashboard").setup ({
    options = {
        theme = 'doom',
        config = {
            header = {}, -- your header
            center = {
                {
                    icon = 'A ',
                    icon_hl = 'Title',
                    desc = 'Find File ',
                    desc_hl = 'String',
                    key = 'b',
                    keymap = 'SPC f f',
                    key_hl = 'Number',
                    key_format = ' %s', -- remove default surronding
                    action = 'lua print(2)'
                },
            },
            footer = {} -- your footer
        },
    },
})
    


