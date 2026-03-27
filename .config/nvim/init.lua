vim.g.mapleader = " "

require("lazy-init")

vim.o.background = "dark"

vim.cmd [[ colorscheme base16-tomorrow-night ]]

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- cursor
vim.opt.guicursor = "n-v-i-c:block-Cursor" -- block in insert mode
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })  -- underline vs highlight
vim.opt.so = 9999

vim.opt.hlsearch = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.colorcolumn = "80"

-- jk
vim.keymap.set({"i", "v", "n"}, "jk", "<Esc>")
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0

-- folds
vim.opt.foldmethod = syntax

vim.opt.modelines = 5

-- command Gv
vim.cmd [[
  command Gv vertical G
]]

-- rebind term keys
-- may need to change timeoutlen above
vim.keymap.set('t', '<C-w>N', '<C-\\><C-n>') -- C-w N for normal mode
vim.keymap.set('t', '<C-w>n', '<C-\\><C-n>') -- C-w n for normal mode
-- TODO: only numbers in normal mode
vim.cmd[[
  au TermOpen * setlocal number
  au TermOpen * setlocal relativenumber
]]

-- highlight term cursor
-- this don't work :/
vim.cmd [[
  hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE
]]

-- local LSP configs in a different file
require("lsp")
