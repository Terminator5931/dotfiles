if true then
  return {}
end
return {
  'stevearc/aerial.nvim',
  keys = {
    {
      '<leader>a',
      '<cmd>AerialToggle!<CR>',
      desc = 'AerialToggle',
    },
  },
  opts = {},
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('aerial').setup {
      on_attach = function(bufnr)
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end,
    }
  end,
}
