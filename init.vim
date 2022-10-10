" Settings
set fcs=eob:\ 
set number
set autoindent
set tabstop=2
set noexpandtab
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set ignorecase
set autoread
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

let mapleader = ' ' 
     
call plug#begin()

" Search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yaegassy/coc-volar', {'do': 'yarn install --frozen-lockfile'}
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Utilities
Plug 'windwp/nvim-ts-autotag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'fedepujol/move.nvim'

call plug#end()

" Launch

lua <<EOF
require('nvim-ts-autotag').setup()

require('telescope').setup{ 
	defaults = { 
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

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('coc')
EOF

" Config
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z=''
let g:airline#extensions#whitespace#enabled=0
let g:airline_skip_empty_sections=1
let g:airline_theme='base16_dracula'

" Mappings
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>:Rg<cr>
nnoremap <leader>t <cmd>Telescope buffers<cr>
nnoremap <leader>b <cmd>Telescope file_browser<CR>
nnoremap <leader>o <cmd>:Telescope coc document_symbols<CR>
nnoremap <leader>l <cmd>:e!<CR>
nnoremap <leader>m <cmd>:CocList diagnostics<CR>
nnoremap <leader>x <cmd>:CocList extensions<CR>
nnoremap <silent> <M-up> :MoveLine(-1)<CR>
vnoremap <silent> <M-up> :MoveBlock(-1)<CR>
nnoremap <silent> <M-down> :MoveLine(1)<CR>
vnoremap <silent> <M-down> :MoveBlock(1)<CR>

" External Files
:source ~/.config/nvim/coc.vim
