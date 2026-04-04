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
		branch = 'master',  -- Use stable master branch instead of rewrite
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
	{
		'nvim-telescope/telescope.nvim',
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
	{ 'kyazdani42/nvim-web-devicons' },
	{ 'onsails/lspkind.nvim' },
	{
		'goolord/alpha-nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('alpha').setup(require('alpha.themes.startify').config)
		end
	},

	-- AI
	{ 'github/copilot.vim' },
	{
		'coder/claudecode.nvim',
		dependencies = { 'folke/snacks.nvim' },
		config = true,
		keys = {
			-- { '<leader>a',  nil,                               desc = 'AI/Claude Code' },
			-- { '<leader>ac', '<cmd>ClaudeCode<cr>',             desc = 'Toggle Claude' },
			-- { '<leader>af', '<cmd>ClaudeCodeFocus<cr>',        desc = 'Focus Claude' },
			-- { '<leader>ar', '<cmd>ClaudeCode --resume<cr>',    desc = 'Resume Claude' },
			-- { '<leader>aC', '<cmd>ClaudeCode --continue<cr>',  desc = 'Continue Claude' },
			-- { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>',        desc = 'Add current buffer' },
			-- { '<leader>as', '<cmd>ClaudeCodeSend<cr>',         mode = 'v', desc = 'Send to Claude' },
			{ '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>',   desc = 'Accept diff' },
			{ '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>',     desc = 'Deny diff' },
		},
	},
	{ 'folke/snacks.nvim' },

	-- Utilities
	{ 'tpope/vim-surround' },
	{ 'tpope/vim-repeat' },
	{ 'tpope/vim-sleuth' },
	{ 'wellle/targets.vim' },
	{ 'numToStr/Comment.nvim' },
	{ 'nacro90/numb.nvim' },
	{
		'subnut/nvim-ghost.nvim',
		lazy = false,
	},
})
