nnoremap <leader>m <cmd>Mason<CR>
nnoremap <leader>g <cmd>Rg<CR>
nnoremap <leader>d <cmd>Telescope diagnostics<CR>
nnoremap <leader>j <cmd>Telescope jumplist<CR>
nnoremap <leader>p <cmd>Telescope find_files<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>o <cmd>Telescope lsp_document_symbols<CR>
nnoremap <leader>e <cmd>Ex<CR>
nnoremap <leader>c <cmd>let @+ = expand('%:p') <CR>
nnoremap <leader>r <cmd>:lua vim.lsp.buf.rename()<CR>

" Disable Arrow Keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" nnoremap <leader>. <cmd>:lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>h <cmd>:lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>H <cmd>:lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>gd <cmd>:lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>gD <cmd>:lua vim.lsp.buf.declaration()<CR>
" nnoremap <leader>gi <cmd>:lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>gt <cmd>:lua vim.lsp.buf.type_definition()<CR>
" nnoremap <leader>gr <cmd>:lua vim.lsp.buf.references()<CR>
