return {
	'neovim/nvim-lspconfig',
	dependencies = {
    { 'williamboman/mason.nvim', config = true },
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', opts = {} },
	},
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright", "rust_analyzer", "bashls", "lua_ls" },
    })

    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    require("lspconfig").lua_ls.setup {
      capabilities = lsp_capabilities,
    }

    require("lspconfig").rust_analyzer.setup {
      capabilities = lsp_capabilities,
    }

    require('lspconfig').pyright.setup {
      capabilities = lsp_capabilities,
    }

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('config-lsp-attach', { clear = true }),
      callback = function(event)
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer =  event.buf, desc = 'LSP: ' .. desc })
      end
      map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    end
      })
end
}
