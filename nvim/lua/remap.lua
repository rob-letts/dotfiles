local keymap = vim.keymap

-- PLUGINS
keymap.set('n', '<leader>x', '<cmd>Mason<CR>')
keymap.set('n', '<leader>z', '<cmd>Lazy<CR>')
keymap.set('n', '<leader>l', '<cmd>LspEslintFixAll<CR>')

-- TELESCOPE
keymap.set('n', '<leader>t', '<cmd>Telescope<CR>')
keymap.set('n', '<leader>m', '<cmd>Telescope diagnostics<CR>')
keymap.set('n', '<leader>j', '<cmd>Telescope jumplist<CR>')
keymap.set('n', '<leader>p', '<cmd>Telescope find_files<CR>')
keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<CR>')
keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>')
keymap.set('n', '<leader>o', '<cmd>Telescope lsp_document_symbols<CR>')

-- LSP
keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')
keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- GOTO
keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

-- UTILITY
keymap.set('n', '<leader>c', '<cmd>let @+ = expand(\'%:p\')<CR>')
keymap.set('n', '<leader>s', '<cmd>write<CR>')
keymap.set('n', '<leader>w', '<cmd>bd<CR>')
keymap.set('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap.set('n', '<leader>h', function() require('hover').open() end)

-- NAVIGATION
keymap.set('n', '<leader>e', '<cmd>Yazi<CR>')
keymap.set('n', '<leader>]', '<cmd>bn<CR>')
keymap.set('n', '<leader>[', '<cmd>bp<CR>')

-- QUICKFIX
keymap.set('n', '<leader>q', '<cmd>copen<CR>')
keymap.set('n', '<leader>)', '<cmd>cn<CR>')
keymap.set('n', '<leader>(', '<cmd>cp<CR>')
