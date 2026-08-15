if true then
  return {}
end
return {
  'saghen/blink.cmp',
  dependencies = {
    'L3MON4D3/LuaSnip',
    build = (function()
      if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
        return
      end
      return 'make install_jsregexp'
    end)(),
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
    },
  },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
      ['<C-d>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<Tab>'] = { 'accept_and_enter', 'fallback' },
      ['<C-l>'] = { 'snippet_forward' },
      ['<C-h>'] = { 'snippet_backward' },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = { documentation = { auto_show = false } },
    sources = {
      default = { 'snippets', 'lsp', 'path', 'buffer' },
    },
    snippets = { preset = 'luasnip' },
    -- fuzzy = { implementation = 'prefer_rust_with_warning' },
    fuzzy = { implementation = 'rust' },
    -- fuzzy = { implementation = 'lua' },
  },
  opts_extend = { 'sources.default' },
  config = function(_, opts)
    local luasnip = require 'luasnip'
    luasnip.config.setup {}
    require 'user.snips'
    require('luasnip.loaders.from_vscode').lazy_load()
    -- require('luasnip.loaders.from_vscode').load()
    require('blink-cmp').setup(opts)
  end,
}
