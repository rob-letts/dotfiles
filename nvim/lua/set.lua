vim.g.mapleader = ' '

vim.g.netrw_banner = 0
vim.g.dracula_colorterm = 0
vim.g.dracula_italic = 0

vim.opt.encoding = 'utf-8'
vim.opt.fillchars = 'eob: '
vim.opt.cursorlineopt = 'line'
vim.opt.signcolumn = 'yes'
vim.opt.clipboard = 'unnamedplus'

-- vim.opt.shiftwidth = 2
vim.opt.scrolloff = 4
vim.opt.updatetime = 300

vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.ignorecase = true
vim.opt.autoread = true

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local api = vim.api
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})
