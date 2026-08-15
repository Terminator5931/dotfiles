if true then
  return {}
end
return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    -- opts = {
    --   cmdline = {
    --     enabled = true,
    --     view = 'cmdline',
    --     format = {
    --       cmdline = { icon = '>', pattern = '^:' },
    --     },
    --     preview = {
    --       enabled = true,
    --     },
    --   },
    --   messages = {
    --     enabled = true,
    --     view = 'cmdline',
    --   },
    --   lsp = {
    --     override = {
    --       ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
    --       ['vim.lsp.util.stylize_markdown'] = true,
    --       ['cmp.entry.get_documentation'] = true,
    --     },
    --   },
    --   presets = {
    --     bottom_search = true,
    --     command_palette = true,
    --     long_message_to_split = true,
    --     inc_rename = false,
    --     lsp_doc_border = false,
    --   },
    -- },
    opts = {
      routes = {
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },
      -- cmdline = {
      --   enabled = true,
      --   view = 'cmdline',
      --   format = {
      --     cmdline = { icon = '>', pattern = '^:' }, -- Custom format for command line
      --   },
      --   preview = {
      --     enabled = true, -- Show previews of commands and pending key feedback
      --   },
      -- },
      -- messages = {
      --   enabled = true,
      --   view = 'mini', -- Use a smaller view for messages
      --   view_error = 'notify', -- Use notifications for errors
      --   view_warn = 'notify', -- Use notifications for warnings
      --   view_info = 'mini', -- Info messages appear in a compact format
      -- },
      -- lsp = {
      --   override = {
      --     ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      --     ['vim.lsp.util.stylize_markdown'] = true,
      --     ['cmp.entry.get_documentation'] = true,
      --   },
      -- },
      -- presets = {
      --   bottom_search = true, -- Search input appears at the bottom
      --   command_palette = true, -- Use command palette for enhanced UI
      --   long_message_to_split = true, -- Long messages split into separate view
      --   inc_rename = false, -- Disable incremental rename UI
      --   lsp_doc_border = true, -- Add border to LSP documentation
      -- },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
}
