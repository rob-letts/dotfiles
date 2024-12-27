-- Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
		build = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
		dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' }
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

	-- Auto Complete
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-nvim-lua' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'windwp/nvim-ts-autotag' },
	{ 'windwp/nvim-autopairs' },

	-- Navigation
	{ 'nvim-lua/popup.nvim' },
	{ 'nvim-lua/plenary.nvim' },
	{ 'junegunn/fzf.vim' },
	{ 'junegunn/fzf' },
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
	},
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
	{ 'ryanoasis/vim-devicons' },
	{ 'kyazdani42/nvim-web-devicons' },
	{ 'onsails/lspkind.nvim' },
	{
		'goolord/alpha-nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('alpha').setup(require('alpha.themes.startify').config)
		end
	},

	-- Utilities
	{ 'tpope/vim-surround' },
	{ 'tpope/vim-repeat' },
	{ 'tpope/vim-sleuth' },
	{ 'wellle/targets.vim' },
	{ 'numToStr/Comment.nvim' },
	{ 'github/copilot.vim' },
	{ 'nacro90/numb.nvim' },
})
