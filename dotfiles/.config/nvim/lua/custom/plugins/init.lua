---@diagnostic disable: assign-type-mismatch
return {
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
}
