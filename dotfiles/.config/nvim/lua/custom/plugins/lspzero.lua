if true then
  return {}
end
return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    { 'williamboman/mason.nvim', config = true },
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'williamboman/mason-lspconfig.nvim',
    { 'hrsh7th/nvim-cmp', config = true },
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = { 'lua_ls', 'clangd' },
    }
    require('mason-lspconfig').setup {}
    local lsp_zero = require 'lsp-zero'
    local lsp_attach = function(client, bufnr)
      lsp_zero.default_keymaps { buffer = bufnr }
      lsp_zero.highlight_symbol(client, bufnr)
    end
    lsp_zero.on_attach(lsp_attach)
    lsp_zero.extend_lspconfig {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
    lsp_zero.ui {
      float_border = 'rounded',
      sign_text = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»',
      },
    }
    lsp_zero.configure('lua_ls', {
      single_file_support = false,
    })
    require('lspconfig').clangd.setup {
      cmd = {
        'clangd',
        '--background-index=false',
        '--pch-storage=memory',
        -- '--compile-commands-dir=.',
        '--clang-tidy=false',
        '--completion-style=detailed',
        '--all-scopes-completion=false',
        '--header-insertion=never',
        '--limit-results=20',
      },
      single_file_support = true,
    }
    require('lspconfig').lua_ls.setup {
      on_init = function(client)
        lsp_zero.nvim_lua_settings(client, {})
      end,
    }
  end,
}
