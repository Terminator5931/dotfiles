return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = { 'rafamadriz/friendly-snippets' },
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    -- local lspkind = require 'lspkind'
    luasnip.config.setup {}
    -- require 'user.snips'
    require('luasnip.loaders.from_vscode').lazy_load()
    -- vim.schedule(function()
    require 'user.snips'
    -- end)
    -- vim.defer_fn(function()
    --   require 'user.snips'
    -- end, 100)
    -- require('luasnip.loaders.from_vscode').load()
    cmp.setup {
      window = {
        documentation = {
          max_width = 50,
        },
      },
      view = {
        docs = {
          auto_open = false,
        },
      },
      formatting = {
        -- format = function(entry, vim_item)
        format = function(_, vim_item)
          local symbol_map = { -- {{{
            Text = '󰉿',
            Method = '󰆧',
            Function = '󰊕',
            Constructor = '',
            Field = '󰜢',
            Variable = '󰀫',
            Class = '󰠱',
            Interface = '',
            Module = '',
            Property = '󰜢',
            Unit = '󰑭',
            Value = '󰎠',
            Enum = '',
            Keyword = '󰌋',
            Snippet = '',
            Color = '󰏘',
            File = '󰈙',
            Reference = '󰈇',
            Folder = '󰉋',
            EnumMember = '',
            Constant = '󰏿',
            Struct = '󰙅',
            Event = '',
            Operator = '󰆕',
            TypeParameter = '',
          } -- }}}
          -- vim_item.abbr = ' ' .. vim_item.abbr
          vim_item.abbr = string.sub(vim_item.abbr, 1, 10)
          vim_item.kind = symbol_map[vim_item.kind] or ''
          -- vim_item.dup = nil
          vim_item.menu = ''
          -- vim_item.menu = (vim_item.menu or '') .. ' '
          -- vim_item.menu = ' '
          return vim_item
        end,
      },
      -- formatting = {{{{
      --   format = lspkind.cmp_format {
      --     mode = 'symbol',
      --     maxwidth = {
      --       abbr = 25,
      --     },
      --     ellipsis_char = '...',
      --     show_labelDetails = true,
      --     before = function(entry, vim_item)
      --       vim_item.menu = nil
      --       return vim_item
      --     end,
      --   },
      -- },}}}
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = function()
          if cmp.visible_docs() then
            cmp.close_docs()
          else
            cmp.open_docs()
          end
        end,
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-j>'] = cmp.mapping.confirm { select = true },

        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm { select = true }
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
        ['<C-j>'] = cmp.mapping(function()
          if luasnip.choice_active() then
            luasnip.change_choice(1)
          end
        end, { 'i', 's' }),
        ['<C-k>'] = cmp.mapping(function()
          if luasnip.choice_active() then
            luasnip.change_choice(-1)
          end
        end, { 'i', 's' }),
      },

      -- sources = cmp.config.sources({
      --   { name = 'lazydev' },
      --   { name = 'luasnip' },
      -- }, {
      --   { name = 'nvim_lsp' },
      -- }, {
      --   { name = 'path' },
      -- }),
      sources = cmp.config.sources({
        { name = 'lazydev' },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
      }, {
        { name = 'path' },
      }),
      -- sources = {
      --   {
      --     name = 'lazydev',
      --     group_index = 1,
      --   },
      --   { name = 'luasnip', group_index = 2 },
      --   { name = 'nvim_lsp', group_index = 3 },
      --   { name = 'path' },
      --   -- { name = 'nvim_lsp_signature_help' },
      -- },
    }
  end,
}
