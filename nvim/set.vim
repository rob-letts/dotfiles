let mapleader = ' '
let &fcs='eob: '
set encoding=utf-8
set number
set relativenumber
set autoindent
set smarttab
set tabstop=2
set softtabstop=2
set nohlsearch
set shiftwidth=2
set hidden
set nobackup
set nowritebackup
set updatetime=300
set ignorecase
set autoread
set shortmess+=c
set nowrap
" set cmdheight=0
set scrolloff=4
set clipboard+=unnamedplus
set completeopt=menu,menuone,noselect
set cursorline
set cursorlineopt=line
set foldmethod=manual
set signcolumn=yes

" Linting
autocmd BufWritePre *.ts,*.js,*.html,*.vue EslintFixAll

" UI
au textyankpost * silent! lua vim.highlight.on_yank()
set termguicolors
let g:dracula_colorterm = 0
let g:dracula_italic = 0
hi DiagnosticError guifg=#eae979
hi DiagnosticWarn guifg=#eae979
hi DiagnosticInfo guifg=#eae979
hi DiagnosticHint guifg=#eae979
