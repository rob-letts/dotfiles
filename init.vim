" Settings
let mapleader = ' ' 
set encoding=utf-8
set fcs=eob:\ 
set number
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
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
set foldenable 
set foldmethod=indent
au textyankpost * silent! lua vim.highlight.on_yank()

" Plugins
call plug#begin()

" Navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" LSP
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yaegassy/coc-volar', {'do': 'yarn install --frozen-lockfile'}

" UI
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'as': 'dracula' }

" Utilities
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'windwp/nvim-ts-autotag'
Plug 'tpope/vim-surround'
Plug 'numToStr/Comment.nvim'
Plug 'fedepujol/move.nvim'
Plug 'm4xshen/autoclose.nvim'
Plug 'kevinhwang91/nvim-ufo' 
Plug 'kevinhwang91/promise-async'

call plug#end()

" Setup
lua <<EOF
require'nvim-ts-autotag'.setup()
require'neoclip'.setup()
require'Comment'.setup()
require'treesitter-context'.setup()
require'ufo'.setup()

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
require'telescope'.load_extension'file_browser'
require'telescope'.load_extension'coc'
require'telescope'.load_extension'neoclip'
EOF

" Status Line Config
let g:airline#extensions#whitespace#enabled=0
let g:airline_theme='base16_dracula'
let g:airline#extensions#default#layout = [['a', 'c'], ['x', 'b']]

" Color Config
let g:dracula_colorterm = 0
let g:dracula_italic = 1
colorscheme dracula

" Mappings
nnoremap <leader>j <cmd>Telescope jumplist<CR>
nnoremap <leader>s <cmd>Telescope spell_suggest<CR>
nnoremap <leader>g <cmd>Telescope git_commits<CR>
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>t <cmd>Telescope buffers<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>e <cmd>Telescope file_browser<CR>
nnoremap <leader>o <cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>
nnoremap <leader>v <cmd>Telescope neoclip<CR>
" TODO: Config :Rg to open in telescope vertical.
nnoremap <leader>r <cmd>:Rg<cr>
nnoremap <leader>l :nohlsearch <cr>:syntax sync fromstart<CR>
nnoremap <leader>m <cmd>:CocList diagnostics<CR>
nnoremap <leader>x <cmd>:CocList extensions<CR>
nnoremap <leader>. <cmd>:call ShowDocumentation()<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <M-up> :MoveLine(-1)<CR>
nnoremap <silent> <M-down> :MoveLine(1)<CR>
vnoremap <silent> <M-up> :MoveBlock(-1)<CR>
vnoremap <silent> <M-down> :MoveBlock(1)<CR>

" External Files
:source ~/.config/nvim/coc.vim
