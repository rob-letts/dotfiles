nnoremap <leader>z <cmd>Twilight<CR>
nnoremap <leader>x <cmd>Mason<CR>
nnoremap <leader>r <cmd>Rg<CR>
nnoremap <leader>w <cmd>WhichKey<CR>
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
nnoremap <F2> :lua vim.lsp.buf.rename() <CR>

nnoremap <silent> <M-j> :MoveLine(1)<CR>
nnoremap <silent> <M-k> :MoveLine(-1)<CR>
vnoremap <silent> <M-k> :MoveBlock(-1)<CR>
vnoremap <silent> <M-j> :MoveBlock(1)<CR>

" Remove Defaults
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
