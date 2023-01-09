let mapleader = ' '
let &fcs='eob: '
set encoding=utf-8
set number
set relativenumber
set shiftwidth=4
set smarttab
set autoindent
set hidden
set nobackup
set nowritebackup
set updatetime=300
set ignorecase
set autoread
set shortmess+=c
set nowrap
set scrolloff=4
set clipboard+=unnamedplus
set completeopt=menu,menuone,noselect
set cursorline
set cursorlineopt=line
set foldmethod=manual
set signcolumn=yes
set noshowmode
set termguicolors

" Autocommands
autocmd BufWritePre *.ts,*.js,*.vue,*.html EslintFixAll
autocmd textyankpost * silent! lua vim.highlight.on_yank()

" UI
let g:netrw_banner = 0
let g:dracula_colorterm = 0
let g:dracula_italic = 0
hi DiagnosticError guifg=#eae979
hi DiagnosticWarn guifg=#eae979
hi DiagnosticInfo guifg=#eae979
hi DiagnosticHint guifg=#eae979
