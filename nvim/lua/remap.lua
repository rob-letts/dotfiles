vim.keymap.set('n', '<leader>e', '<cmd>Ex<CR>')
vim.keymap.set('n', '<leader>x', '<cmd>Mason<CR>')
vim.keymap.set('n', '<leader>z', '<cmd>Lazy<CR>')
vim.keymap.set('n', '<leader>l', '<cmd>EslintFixAll<CR>')

vim.keymap.set('n', '<leader>t', '<cmd>Telescope<CR>')
vim.keymap.set('n', '<leader>m', '<cmd>Telescope diagnostics<CR>')
vim.keymap.set('n', '<leader>j', '<cmd>Telescope jumplist<CR>')
vim.keymap.set('n', '<leader>s', '<cmd>Telescope grep_string<CR>')
vim.keymap.set('n', '<leader>p', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>o', '<cmd>Telescope lsp_document_symbols<CR>')

vim.keymap.set('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>}', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<leader>{', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

vim.keymap.set('n', '<leader>c', '<cmd>let @+ = expand(\'%:p\')<CR>')

vim.keymap.set('n', '<leader>]', '<cmd>bn<CR>')
vim.keymap.set('n', '<leader>[', '<cmd>bp<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>copen<CR>')
vim.keymap.set('n', 'q]', '<cmd>cn<CR>')
vim.keymap.set('n', 'q[', '<cmd>cp<CR>')

vim.keymap.set('n', '<Up>', '<nop>')
vim.keymap.set('n', '<Down>', '<nop>')
vim.keymap.set('n', '<Left>', '<nop>')
vim.keymap.set('n', '<Right>', '<nop>')

