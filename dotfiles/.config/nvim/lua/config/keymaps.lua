-- TOGGLETERM
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
end
vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
-- Window
-- vim.keymap.set('n', '<M-h>', '<C-w><', { silent = true, noremap = true })
-- vim.keymap.set('n', '<M-l>', '<C-w>>', { silent = true, noremap = true })
-- vim.keymap.set('n', '<M-k>', '<C-w>+', { silent = true, noremap = true })
-- vim.keymap.set('n', '<M-j>', '<C-w>-', { silent = true, noremap = true })

-- LEETCODE
-- vim.keymap.set("n", "<localleader>lr", "<CMD>Leet run<CR>", { desc = "[R]un", silent = true, noremap = true })
-- vim.keymap.set("n", "<localleader>ls", "<CMD>Leet submit<CR>", { desc = "[S]ubmit", silent = true, noremap = true })
-- vim.keymap.set("n", "<localleader>ld", "<CMD>Leet desc<CR>", { desc = "[D]escription", silent = true, noremap = true })
-- vim.keymap.set("n", "<localleader>lo", "<CMD>Leet console<CR>", { desc = "[O]utput", silent = true, noremap = true })

-- BUFFER
vim.keymap.set('n', '<localleader>d', '<CMD>bd!<CR>', { desc = '[B]uffer [D]elete', silent = true, noremap = true })
vim.keymap.set('n', '[b', '<CMD>bprev<CR>', { silent = true, noremap = true })
vim.keymap.set('n', ']b', '<CMD>bnext<CR>', { silent = true, noremap = true })

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<localleader>w', '<CMD>w<CR>', { desc = 'Save file', silent = true, noremap = true })
vim.keymap.set('n', '<localleader>r', function()
  local ft = vim.bo.filetype
  local compiled_langs = {
    cpp = true,
    c = true,
    -- java = true,
    rust = true,
  }

  if vim.bo.ft == 'html' then
    -- Kill existing live-server instances before running
    vim.fn.jobstart({ 'pkill', '-f', 'node /usr/sbin/live-server' }, { detach = true })
  end

  if vim.bo.modified then
    vim.cmd 'write'
    vim.cmd 'RunCppFile'
    return
  end

  -- buffer is unmodified
  local file_without_ext = vim.fn.expand '%:t:r'
  -- local bin_path = vim.fn.expand '~/.cache/cppBin/' .. file_without_ext
  if compiled_langs[ft] and vim.loop.fs_stat(vim.fn.expand '~/.cache/cppBin/' .. vim.fn.expand '%:t:r') then
    -- vim.fn.mkdir('~/cache/cppBin/', 'p')
    local cmd = vim.fn.expand '~/.cache/cppBin/' .. file_without_ext
    -- local cmd = './' .. file_without_ext
    vim.cmd 'split'
    vim.cmd 'resize 12'
    vim.cmd('terminal zsh -c ' .. vim.fn.shellescape(cmd))
    vim.cmd 'startinsert'
  else
    vim.cmd 'RunCppFile'
  end
end, { desc = 'Code [R]un', silent = false, noremap = true })

vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', 'jk', '<Esc>')

-- load the session for the current directory
-- vim.keymap.set('n', '<leader>pr', function()
--   require('persistence').load()
-- end, { desc = '[R]estore last session cwd' })
-- vim.keymap.set('n', '<leader>ps', function()
--   require('persistence').select()
-- end, { desc = '[S]elect sessions' })
-- vim.keymap.set('n', '<leader>pl', function()
--   require('persistence').load { last = true }
-- end, { desc = '[L]oad last' })
-- vim.keymap.set('n', '<leader>pd', function()
--   require('persistence').stop()
-- end, { desc = '[D]elete session' })
-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>qf', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uick[F]ix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- aerial.nvim
-- You probably also want to set a keymap to toggle aerial
-- vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
vim.keymap.del('n', 'gcc')
