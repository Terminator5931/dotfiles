return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {
      '<leader>sh',
      function()
        require('fzf-lua').help_tags()
      end,
      desc = '[S]earch [H]elp',
    },
    {
      '<leader>sk',
      function()
        require('fzf-lua').keymaps()
      end,
      desc = '[S]earch [K]eymaps',
    },
    {
      '<leader>sf',
      function()
        require('fzf-lua').files { no_ignore = true }
      end,
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>ss',
      function()
        require('fzf-lua').builtin()
      end,
      desc = '[S]earch [S]elect FZF-Lua builtin',
    },
    {
      '<leader>sw',
      function()
        require('fzf-lua').grep_cword()
      end,
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>sg',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>sr',
      function()
        require('fzf-lua').resume()
      end,
      desc = '[S]earch [R]esume',
    },
    {
      '<leader>s.',
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = '[S]earch Recent Files ("." for repeat)',
    },
    {
      '<leader>,',
      function()
        require('fzf-lua').buffers()
      end,
      desc = 'which_key_ignore',
    },
    {
      '<leader>/',
      function()
        require('fzf-lua').blines { previewer = false }
      end,
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader>s/',
      function()
        require('fzf-lua').live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
      end,
      desc = '[S]earch [/] in Open Files',
    },
    {
      '<leader>sn',
      function()
        -- require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
        require('fzf-lua').files { cwd = vim.fn.expand '~/dotfiles/.config/nvim' }
      end,
      desc = '[S]earch [N]eovim files',
    },
  },

  opts = {
    winopts = {
      fullscreen = true,
    },
    keymap = {
      fzf = {
        ['ctrl-y'] = 'accept',
      },
    },
    files = {
      fd_opts = '--color=never --type f --hidden --follow --exclude .git --exclude node_modules --exclude dist --exclude vendor --exclude package-lock.json',
    },
    grep = {
      rg_opts = "--color=never --no-heading --hidden --smart-case --line-number --column --glob '!**/.git/*' --glob '!**/node_modules/*' --glob '!**/dist/*' --glob '!**/vendor/*' --glob '!**/package-lock.json'",
    },
  },
  config = function(_, opts)
    require('fzf-lua').setup(opts)
  end,
}
