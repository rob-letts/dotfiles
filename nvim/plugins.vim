" Plugins
call plug#begin()

" Language Server Protocol
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Winbar
Plug 'SmiteshP/nvim-navic'
Plug 'utilyre/barbecue.nvim'

" Code Completion
Plug 'folke/which-key.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'github/copilot.vim'

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-context'

" Navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'startup-nvim/startup.nvim'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'folke/twilight.nvim'
Plug 'onsails/lspkind.nvim'

" Utilities
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'windwp/nvim-ts-autotag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'numToStr/Comment.nvim'
Plug 'fedepujol/move.nvim'
Plug 'wellle/targets.vim'

call plug#end()
