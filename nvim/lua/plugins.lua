-- Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		branch = 'master',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = {
					'html', 'css', 'javascript', 'json',
					'scss', 'typescript', 'vim', 'vue', 'lua'
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				}
			})
		end
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{
				'williamboman/mason.nvim',
				config = true
			},
			'williamboman/mason-lspconfig.nvim',
		},
	},

	-- Completion
	{
		'saghen/blink.cmp',
		version = '1.*',
		dependencies = { { 'L3MON4D3/LuaSnip', version = 'v2.*' } },
		opts = {
			keymap = {
				preset = 'default',
				['<CR>'] = { 'accept', 'fallback' },
				['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
			},
			appearance = {
				nerd_font_variant = 'mono',
			},
			snippets = { preset = 'luasnip' },
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
			cmdline = {
				sources = { 'cmdline' },
			},
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 200 },
				accept = { auto_brackets = { enabled = true } },
				menu = { border = 'rounded' },
			},
		},
	},

	-- Editing
	{ 'windwp/nvim-autopairs' },
	{ 'windwp/nvim-ts-autotag' },
	{ 'kylechui/nvim-surround', version = '*', event = 'VeryLazy', config = true },

	-- Navigation
	{ 'nvim-lua/plenary.nvim' },
	{ 'nvim-telescope/telescope.nvim' },
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	},

	-- UI
	{
		'catppuccin/nvim',
		name = 'catppuccin'
	},
	{ 'nvim-lualine/lualine.nvim' },
	{ 'nvim-tree/nvim-web-devicons' },
	{
		'folke/snacks.nvim',
		priority = 1000,
		lazy = false,
		opts = {
			dashboard = { enabled = true },
		},
	},

	-- AI
	{ 'github/copilot.vim' },
	{
		'coder/claudecode.nvim',
		dependencies = { 'folke/snacks.nvim' },
		config = true,
		keys = {
			{ '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
			{ '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>',   desc = 'Deny diff' },
		},
	},

	-- Utilities
	{ 'tpope/vim-sleuth' },
	{ 'wellle/targets.vim' },
	{ 'nacro90/numb.nvim' },
	{
		'subnut/nvim-ghost.nvim',
		lazy = false,
	},
})
