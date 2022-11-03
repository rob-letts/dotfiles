" Settings
let mapleader = ' '
set encoding=utf-8
set fcs=eob:\
set number
set relativenumber
set autoindent
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set hidden
set nobackup
set nowritebackup
set updatetime=300
set ignorecase
set autoread
set hidden
set shortmess+=c
set nowrap
set cmdheight=0
set scrolloff=5
set clipboard+=unnamedplus
au textyankpost * silent! lua vim.highlight.on_yank()
set completeopt=menu,menuone,noselect
set cursorline
set cursorlineopt=line

" Plugins
call plug#begin()

" Language Server Protocol
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Code Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-context'

" Diagnostics
Plug 'folke/trouble.nvim'

" Linting
Plug 'dense-analysis/ale'

" Navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'simrat39/symbols-outline.nvim'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'folke/twilight.nvim'

" Utilities
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-fugitive'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'windwp/nvim-ts-autotag'
Plug 'tpope/vim-surround'
Plug 'numToStr/Comment.nvim'
Plug 'fedepujol/move.nvim'
Plug 'wellle/targets.vim'

call plug#end()

" Plugin Setup
lua <<EOF

require'mason'.setup()
require'mason-lspconfig'.setup()
require'nvim-ts-autotag'.setup()
require'neoclip'.setup()
require'Comment'.setup()
require'treesitter-context'.setup()
require'symbols-outline'.setup()
require'trouble'.setup()
require'twilight'.setup()

require'telescope'.setup{
 	defaults = {
		layout_strategy = 'vertical',
		file_ignore_patterns = {
			'node_modules'
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		}
	}
}

require'telescope'.load_extension'fzf'
require'telescope'.load_extension'neoclip'

local cmp = require'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	})
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' },
	}, {
		{ name = 'buffer' },
	})
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup LSP Config.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['html'].setup { capabilities = capabilities }
require('lspconfig')['emmet_ls'].setup { capabilities = capabilities }
require('lspconfig')['volar'].setup { capabilities = capabilities }
require('lspconfig')['cssls'].setup { capabilities = capabilities }
require('lspconfig')['eslint'].setup { capabilities = capabilities }
require('lspconfig')['jsonls'].setup { capabilities = capabilities }
require('lspconfig')['sumneko_lua'].setup { capabilities = capabilities }
require('lspconfig')['stylelint_lsp'].setup { capabilities = capabilities }

EOF

" UI Config
let g:dracula_colorterm = 0
let g:dracula_italic = 0
set termguicolors
colorscheme dracula

" Status Line Config
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#default#layout = [['a', 'c'], ['x', 'b']]

" Linting Config
let g:ale_fixers = { '*': ['eslint'] }
let g:ale_fix_on_save = 1

" Mappings
nnoremap <leader>o <cmd>:SymbolsOutline<CR>
nnoremap <leader>g <cmd>Telescope live_grep<CR>
nnoremap <leader>h :nohlsearch <cr>:syntax sync fromstart<CR>
nnoremap <leader>l <cmd>:Twilight<CR>
nnoremap <leader>m <cmd>:TroubleToggle<CR>
nnoremap <leader>j <cmd>Telescope jumplist<CR>
nnoremap <leader>p <cmd>Telescope find_files<CR>
nnoremap <leader>t <cmd>Telescope buffers<CR>
nnoremap <leader>f <cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>
nnoremap <leader>x <cmd>:Mason<CR>
nnoremap <leader>v <cmd>Telescope neoclip<CR>
nnoremap <leader>r <cmd>:Rg<CR>
nnoremap <leader>c <cmd>:let @+ = expand("%:p") <CR> " Get path of current file
nnoremap <leader>s <cmd>:SplitjoinSplit<CR>

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

nnoremap <silent> <C-j> :MoveLine(1)<CR>
nnoremap <silent> <C-k> :MoveLine(-1)<CR>
vnoremap <silent> <C-k> :MoveBlock(-1)<CR>
vnoremap <silent> <C-j> :MoveBlock(1)<CR>