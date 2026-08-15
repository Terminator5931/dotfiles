---@diagnostic disable: assign-type-mismatch
return {
  {
    'https://codeberg.org/andyg/leap.nvim',
    event = 'VeryLazy',
    opts = {},
    config = function()
      vim.keymap.set('n', 's', function()
        require('leap').leap { target_windows = { vim.fn.win_getid() } }
      end)
      vim.keymap.set('n', 'gs', function()
        require('leap').leap { target_windows = require('leap.util').get_enterable_windows() }
      end)
    end,
  },
  -- {
  --   'CRAG666/code_runner.nvim',
  --   opts = {
  --     focus = 'true',
  --     -- mode = 'tab',
  --     startinsert = true,
  --     filetype_path = vim.fn.expand '~/.config/nvim/lua/user/code_runner.json',
  --   },
  -- },
  -- {
  --   'folke/persistence.nvim',
  --   event = 'BufReadPre',
  --   opts = {},
  -- },

  -- {
  --   'akinsho/bufferline.nvim',
  --   version = '*',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   enabled = false,
  --   opts = {
  --     options = {
  --       style_preset = minimal, -- or default
  --       show_buffer_close_icons = false,
  --       show_close_icon = false,
  --     },
  --   },
  -- },
  -- {
  --   'onsails/lspkind.nvim',
  --   opts = {},
  -- },
}
