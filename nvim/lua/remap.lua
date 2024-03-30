-- PLUGINS
vim.keymap.set('n', '<leader>x', '<cmd>Mason<CR>')
vim.keymap.set('n', '<leader>z', '<cmd>Lazy<CR>')
vim.keymap.set('n', '<leader>l', '<cmd>EslintFixAll<CR>')
vim.keymap.set('n', '<leader>?', '<cmd>WhichKey<CR>')

-- TELESCOPE
vim.keymap.set('n', '<leader>t', '<cmd>Telescope<CR>')
vim.keymap.set('n', '<leader>m', '<cmd>Telescope diagnostics<CR>')
vim.keymap.set('n', '<leader>j', '<cmd>Telescope jumplist<CR>')
vim.keymap.set('n', '<leader>p', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>o', '<cmd>Telescope lsp_document_symbols<CR>')

-- LSP
vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>')
vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- GOTO
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

-- UTILITY
vim.keymap.set('n', '<leader>n', '<cmd>Neogit<CR>')
vim.keymap.set('n', '<leader>c', '<cmd>let @+ = expand(\'%:p\')<CR>')
vim.keymap.set('n', '<leader>s', '<cmd>write<CR>')
vim.keymap.set('n', '<leader>.', '<cmd>CodeActionMenu<CR>')
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>')

-- NAVIGATION
vim.keymap.set('n', '<leader>e', '<cmd>Ex<CR>')
vim.keymap.set('n', '<leader>}', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<leader>{', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<leader>w', '<cmd>bd<CR>')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- QUICKFIX
vim.keymap.set('n', '<leader>q', '<cmd>copen<CR>')
vim.keymap.set('n', '<leader>qq', '<cmd>cclose<CR>')
vim.keymap.set('n', '<leader>]', '<cmd>bn<CR>')
vim.keymap.set('n', '<leader>[', '<cmd>bp<CR>')
vim.keymap.set('n', '<leader>)', '<cmd>cn<CR>')
vim.keymap.set('n', '<leader>(', '<cmd>cp<CR>')
