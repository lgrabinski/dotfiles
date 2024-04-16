require("lazy").setup({
    "nvim-tree/nvim-tree.lua",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
    "nvim-lualine/lualine.nvim",
    {
        "nvimdev/dashboard-nvim",
        event = 'VimEnter',
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    "luukvbaal/nnn.nvim",
    
    -- Themes
    { "catppuccin/nvim", name="catppuccin", priority = 1000 },
    "wilmanbarrios/palenight.nvim",

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    'nvim-telescope/telescope-ui-select.nvim',

})

