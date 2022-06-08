return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Use dependency and run lua function after load
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }

	use 'folke/which-key.nvim'
	use 'lunarvim/darkplus.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-orgmode/orgmode'
    
	-- Telescope
	-- use 'nvim-lua/plenary.nvim' -- Required by Telescope
	use 'nvim-telescope/telescope.nvim'

	-- Dashboard
	use 'glepnir/dashboard-nvim'

	-- nnn file manager
	use 'luukvbaal/nnn.nvim'

    -- CMP -> Completion
	use 'hrsh7th/nvim-cmp' -- Completion engine
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip' -- snippet completions

    -- Snippets
    use 'L3MON4D3/LuaSnip'

	-- LSP
	use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'williamboman/nvim-lsp-installer' -- simple to use language servert installer

    -- File Expolorer
    use 'kyazdani42/nvim-tree.lua'

    -- Other
    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim

    -- Themes
    use 'kyazdani42/nvim-palenight.lua'
end)
