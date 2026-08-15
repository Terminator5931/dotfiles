vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.writebackup = false
vim.opt.backup = false
-- vim.opt.showcmd = false
-- vim.opt.cmdheight = 0
vim.opt.scrolloff = 12
vim.opt.mouse = ''
vim.opt.fillchars = { eob = ' ' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
-- INDENT
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.softtabstop = -1
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.wrap = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
-- vim.opt.path:append { '**' }
vim.opt.wildignore:append '*/node_modules/*'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = 'cursor'
vim.opt.mouse = ''
-- vim.opt.formatoptions:append 'r'
vim.opt.formatoptions:append 'qjlr1'

-- vim.lsp.log.set_level 'OFF'
vim.lsp.log.set_level(vim.log.levels.OFF)
-- vim.log.levels = '5'
-- vim.o.loglev = 0
-- vim.log.levels.ERROR
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.g.have_nerd_font = true
vim.opt.showmode = false
vim.opt.undofile = false
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
-- vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.cursorline = true
-- vim.o.shadafile = '<10,f'
vim.opt.shada = ":0,'0,<50,h"
vim.o.swapfile = false
vim.o.showtabline = 0
-- FOLDS
vim.opt.foldenable = true
vim.opt.foldmethod = 'marker'
vim.opt.foldlevel = 0

vim.o.autoread = true

vim.opt.guicursor = ''
-- vim.opt.guicursor = { 'n-v-c-sm-i-ci-ve-r-cr-o-t:block' }
-- vim.ui.select = function(items, opts, on_choice)
--   if not items or #items == 0 then
--     -- nothing to select, fallback to default UI or just auto-cancel
--     vim.notify('No items to select', vim.log.levels.WARN)
--     on_choice(nil, nil)
--     return
--   end
--
--   require('fzf-lua').fzf_exec(items, {
--     prompt = opts.prompt or '',
--     winopts = { fullscreen = true },
--     actions = {
--       ['default'] = function(selected)
--         local idx = vim.tbl_indexof(items, selected[1])
--         if idx == -1 then
--           on_choice(nil, nil)
--         else
--           on_choice(items[idx], idx)
--         end
--       end,
--     },
--   })
-- end
--
