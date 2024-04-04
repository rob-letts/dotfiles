local g = vim.g
local opt = vim.opt
local api = vim.api

g.mapleader = ' '
g.netrw_banner = 0

opt.encoding = 'utf-8'
opt.fillchars = 'eob: '
opt.cursorlineopt = 'line'
opt.signcolumn = 'yes'
opt.clipboard = 'unnamedplus'

opt.scrolloff = 8
opt.updatetime = 300
opt.tabstop = 4

opt.cursorline = true
opt.wrap = false
opt.termguicolors = true
opt.showmode = false
opt.showcmd = false
opt.number = true
opt.relativenumber = true
opt.smarttab = true
opt.autoindent = true
opt.hidden = true
opt.incsearch = true
opt.backup = false
opt.writebackup = false
opt.ignorecase = true
opt.smartcase = true
opt.autoread = true
opt.backspace = 'indent,eol,start'

opt.completeopt = {'menu', 'menuone', 'noselect'}

local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})
