require("lazy").setup({
    { "catppuccin/nvim", name="catppuccin", priority = 1000 },
    "nvim-tree/nvim-tree.lua",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "folke/which-key.nvim",
    "nvim-lualine/lualine.nvim",
    {
        "nvimdev/dashboard-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
})

