nnoremap <leader>m <cmd>Mason<CR>
nnoremap <leader>g <cmd>Rg<CR>
nnoremap <leader>d <cmd>Telescope diagnostics<CR>
nnoremap <leader>j <cmd>Telescope jumplist<CR>
nnoremap <leader>p <cmd>Telescope find_files<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>o <cmd>Telescope lsp_document_symbols<CR>
nnoremap <leader>e <cmd>Ex<CR>
nnoremap <leader>c <cmd>let @+ = expand('%:p') <CR>
nnoremap <leader>r <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>. <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>h <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gd <cmd>:lua vim.lsp.buf.definition()<CR>
nnoremap gr <cmd>:lua vim.lsp.buf.references()<CR>

" Disable Arrow Keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
