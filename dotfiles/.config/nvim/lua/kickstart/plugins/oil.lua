return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      keymaps = {
        ['o'] = 'actions.select',
      },
      delete_to_trash = true,
      columns = {
        'icon',
        -- "permissions",
        'size',
        -- "mtime",
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
