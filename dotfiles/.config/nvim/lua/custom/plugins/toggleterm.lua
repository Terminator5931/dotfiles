if true then
  return {}
end
return {
  {
    {
      'akinsho/toggleterm.nvim',
      version = '*',
      opts = {
        open_mapping = [[<c-\>]],
        float_opts = {
          border = 'single',
        },
      },
    },
  },
}
