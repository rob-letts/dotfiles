" Plugins
nnoremap <leader>m <cmd>Mason<CR>
nnoremap <leader>r <cmd>Rg<CR>
nnoremap <leader>d <cmd>Telescope diagnostics<CR>
nnoremap <leader>g <cmd>Telescope live_grep<CR>
nnoremap <leader>j <cmd>Telescope jumplist<CR>
nnoremap <leader>p <cmd>Telescope find_files<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>s <cmd>Telescope lsp_document_symbols<CR>

" Vim Remaps
nnoremap <leader>e <cmd>Ex<CR> " Open Explorer
nnoremap <leader>c <cmd>let @+ = expand('%:p') <CR> " Copy file path to clipboard

" Disable Arrow Keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" LSP Remaps
nnoremap <F2> <cmd>:lua vim.lsp.buf.rename()<CR>
nnoremap <leader>. <cmd>:lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>h <cmd>:lua vim.lsp.buf.hover()<CR>
nnoremap <leader>H <cmd>:lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>gd <cmd>:lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gD <cmd>:lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>gi <cmd>:lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gt <cmd>:lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gr <cmd>:lua vim.lsp.buf.references()<CR>
