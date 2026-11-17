if true then
  return {}
end
return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-y>'] = function(prompt_bufnr)
              require('telescope.actions').select_default(prompt_bufnr)
            end,
          },
          n = {
            ['<C-y>'] = function(prompt_bufnr)
              require('telescope.actions').select_default(prompt_bufnr)
            end,
            -- ['d'] = function(prompt_bufnr)
            ['d'] = function()
              -- local actions = require 'telescope.actions'
              local action_state = require 'telescope.actions.state'
              local selection = action_state.get_selected_entry()
              if selection then
                vim.api.nvim_buf_delete(selection.bufnr, { force = true })
              end
              -- actions.close(prompt_bufnr)
            end,
          },
        },
        file_ignore_patterns = { '^bin', '^node_modules' },
        layout_strategy = 'horizontal',
        layout_config = { height = { padding = 0 }, width = { padding = 0 }, preview_cutoff = 0 },
      },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'

    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    -- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sf', function()
      builtin.find_files { no_ignore = true }
    end, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = 'which_key_ignore' })

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    vim.keymap.set('n', '<leader>sn', function()
    end, { desc = '[S]earch [N]eovim files' })
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    triggers = {
      { '<leader>', mode = { 'n', 'v' } },
      { 'g', mode = { 'n', 'v' } },
      { 'z', mode = { 'n', 'v' } },
      { '<localleader>', mode = 'n' },
    },
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = false,
        -- suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = true,
        g = true,
      },
    },
    icons = {
      mappings = vim.g.have_nerd_font,
      -- keys = vim.g.have_nerd_font,
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },
    spec = {
      { '<leader>b', group = '[B]uffer' },
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>p', group = '[P]ersistence' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>g', group = '[G]it Hunk', mode = { 'n', 'v' } },
      { '<localleader>l', group = '[L]eet' },
    },
  },
}
