if true then
  return {}
end
-- local leet_arg = 'leetcode.nvim'
-- local opts = {
--   -- configuration goes here
--   arg = leet_arg,
--   description = {
--     position = 'left', ---@type lc.position
--
--     width = '100%', ---@type lc.size
--
--     show_stats = false, ---@type boolean
--   },
--   injector = { ---@type table<lc.lang, lc.inject>
--     ['cpp'] = {
--       before = { '#include <bits/stdc++.h>', 'using namespace std;' },
--     },
--   },
-- }
return {
  'kawre/leetcode.nvim',
  -- enabled = false,
  dependencies = {
    'nvim-telescope/telescope.nvim',
    -- 'ibhagwan/fzf-lua',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  event = 'VeryLazy',
  config = function()
    require('leetcode').setup(opts)
  end,
  lazy = leet_arg ~= vim.fn.argv(0, -1),
}
