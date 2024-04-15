require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    styles = { -- Handle the styles of general hi groups (see ':h highlight-args'):
        comments = { "italic" }, -- chane the style of comments
    },
})

vim.o.termguicolors =  true
vim.o.background = "dark"
vim.cmd[[colorscheme catppuccin]]
