" https://linuxize.com/post/vim-find-replace/
" https://github.com/nvim-telescope/telescope-file-browser.nvim
" https://github.com/tpope/vim-surround
" https://github.com/tpope/vim-repeat
" https://github.com/github/copilot.vim
" https://github.com/filipdutescu/renamer.nvim
" https://github.com/folke/which-key.nvim-cmp
" https://github.com/utilyre/barbecue.nvim
" https://github.com/SmiteshP/nvim-navic

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
set completeopt=menu,menuone,noselect
set cursorline
set cursorlineopt=line
set foldmethod=manual
set signcolumn=yes
au textyankpost * silent! lua vim.highlight.on_yank() 
autocmd BufWritePre *.ts,*.js,*.html,*.vue EslintFixAll

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

" Linting
Plug 'mfussenegger/nvim-lint'

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
require'twilight'.setup()
require'startup'.setup()

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
require'telescope'.load_extension'file_browser'

local cmp = require'cmp'
local lspkind = require'lspkind'

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
		-- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
		-- ['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		-- ['<C-e>'] = cmp.mapping.abort(),
		-- ['<CR>'] = cmp.mapping.confirm({ select = true }), 
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol',
			maxwidth = 50,
			ellipsis_char = '...'
		})
	}
})

-- cmp.setup.filetype('gitcommit', {
-- 	sources = cmp.config.sources({
-- 		{ name = 'cmp_git' }, 
-- 	}, {
-- 		{ name = 'buffer' },
-- 	})
-- })

-- cmp.setup.cmdline({ '/', '?' }, {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = 'buffer' }
-- 	}
-- })

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
require('lspconfig')['cssls'].setup { capabilities = capabilities }
require('lspconfig')['emmet_ls'].setup { capabilities = capabilities }
require('lspconfig')['volar'].setup { capabilities = capabilities }
require('lspconfig')['eslint'].setup { capabilities = capabilities }
require('lspconfig')['jsonls'].setup { capabilities = capabilities }

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "css", "vue", "typescript" },
  sync_install = false,
  auto_install = true,
  -- ignore_install = { "javascript" },
  highlight = {
    enable = true,
    -- disable = { "c", "rust" },
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}

vim.diagnostic.config({ virtual_text = false })

EOF

" UI
let g:dracula_colorterm = 0
let g:dracula_italic = 0
set termguicolors
colorscheme dracula
hi DiagnosticError guifg=#eae979
hi DiagnosticWarn guifg=#eae979
hi DiagnosticInfo guifg=#eae979
hi DiagnosticHint guifg=#eae979
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#default#layout = [['a', 'c'], ['x', 'b']]

" Mappings
nnoremap <leader>z <cmd>Twilight<CR>
nnoremap <leader>x <cmd>Mason<CR>
nnoremap <leader>r <cmd>Rg<CR>
nnoremap <leader>s <cmd>SplitjoinSplit<CR>
nnoremap <leader>m <cmd>Telescope diagnostics<CR>
nnoremap <leader>g <cmd>Telescope live_grep<CR>
nnoremap <leader>e <cmd>Telescope file_browser<CR>
nnoremap <leader>j <cmd>Telescope jumplist<CR>
nnoremap <leader>p <cmd>Telescope find_files<CR>
nnoremap <leader>t <cmd>Telescope buffers<CR>
nnoremap <leader>o <cmd>Telescope lsp_document_symbols<CR>
nnoremap <leader>f <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>v <cmd>Telescope neoclip<CR>
nnoremap <leader>c <cmd>let @+ = expand('%:p') <CR>
nnoremap <leader>h :nohlsearch <cr>:syntax sync fromstart<CR>
nnoremap <silent> <M-j> :MoveLine(1)<CR>
nnoremap <silent> <M-k> :MoveLine(-1)<CR>
vnoremap <silent> <M-k> :MoveBlock(-1)<CR>
vnoremap <silent> <M-j> :MoveBlock(1)<CR>

" Remove Defaults
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

