vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    -- vim.highlight.on_yank()
    vim.hl.on_yank()
  end,
})

local run_commands = {
  cpp = 'cd $dir && mkdir -p /tmp/cppBin && clang++ -std=c++17 -stdlib=libstdc++ -O0 -DLOCAL -include-pch /home/terminator/.local/includes/clang_dsa.h.pch -I/home/terminator/.local/includes $filePath -o /tmp/cppBin/$fileNameWithoutExt && /tmp/cppBin/$fileNameWithoutExt',
  -- java = 'cd $dir && javac $fileName && java $fileNameWithoutExt',
  java = 'cd $dir && java -XX:TieredStopAtLevel=1 $fileName',
  python = 'python3 -u $filePath',
  typescript = 'deno run $filePath',
  javascript = 'node $filePath',
  rust = 'cd $dir && rustc $fileName -o $dir/$fileNameWithoutExt && $dir/$fileNameWithoutExt',
  html = 'cd $dir && live-server -q --entry-file=$fileName',
}

vim.api.nvim_create_user_command('RunCppFile', function()
  local ft = vim.bo.filetype
  local cmd_template = run_commands[ft]
  if not cmd_template then
    vim.notify('No run command defined for filetype: ' .. ft, vim.log.levels.WARN)
    return
  end
  -- Substitute only if command exists
  local cmd = cmd_template
    :gsub(vim.pesc '$fileNameWithoutExt', vim.fn.expand '%:t:r')
    :gsub(vim.pesc '$fileName', vim.fn.expand '%:t')
    :gsub(vim.pesc '$filePath', vim.fn.expand '%:p')
    :gsub(vim.pesc '$dir', vim.fn.expand '%:p:h')
  if vim.bo.filetype == 'html' then
    vim.fn.jobstart({ 'zsh', '-c', cmd }, { detach = true })
    return
  end
  vim.cmd 'split'
  vim.cmd 'resize 12'
  vim.cmd('terminal zsh -c ' .. vim.fn.shellescape(cmd))
  vim.cmd 'startinsert'
end, {})

-- vim.api.nvim_create_autocmd({ 'QuitPre', 'FocusLost', 'BufLeave', 'BufWinLeave', 'BufDelete', 'VimLeavePre' }, {
--   group = vim.api.nvim_create_augroup('UserAutoSave', { clear = true }),
--   pattern = '*',
--   callback = function()
--     if vim.bo.modified and vim.fn.expand '%' ~= '' and vim.bo.buftype == '' then
--       vim.cmd 'silent write'
--     end
--   end,
-- })

--  Made only for cpp file debug
-- vim.api.nvim_create_autocmd('CursorHold', {
--   -- pattern = {"error.txt", "*.txt"},  -- Multiple patterns
--   pattern = 'error.txt',
--   command = 'checktime',
-- })
