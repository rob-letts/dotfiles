local keymap = vim.keymap

-- PLUGINS
keymap.set('n', '<leader>x', '<cmd>Mason<CR>')
keymap.set('n', '<leader>z', '<cmd>Lazy<CR>')
keymap.set('n', '<leader>l', '<cmd>EslintFixAll<CR>')

-- TELESCOPE
keymap.set('n', '<leader>t', '<cmd>Telescope<CR>')
keymap.set('n', '<leader>m', '<cmd>Telescope diagnostics<CR>')
keymap.set('n', '<leader>j', '<cmd>Telescope jumplist<CR>')
keymap.set('n', '<leader>p', '<cmd>Telescope find_files<CR>')
keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<CR>')
keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>')
keymap.set('n', '<leader>o', '<cmd>Telescope lsp_document_symbols<CR>')

-- LSP
keymap.set('n', '<leader>f', '<cmd>lua lsp.buf.format()<CR>')
keymap.set('n', '<leader>r', '<cmd>lua lsp.buf.rename()<CR>')

-- GOTO
keymap.set('n', 'gd', '<cmd>lua lsp.buf.definition()<CR>')
keymap.set('n', 'gr', '<cmd>lua lsp.buf.references()<CR>')
keymap.set('n', 'gi', '<cmd>lua lsp.buf.implementation()<CR>')
keymap.set('n', 'gt', '<cmd>lua lsp.buf.type_definition()<CR>')

-- UTILITY
keymap.set('n', '<leader>c', '<cmd>let @+ = expand(\'%:p\')<CR>')
keymap.set('n', '<leader>s', '<cmd>write<CR>')
keymap.set('n', '<leader>w', '<cmd>bd<CR>')
keymap.set('n', '<leader>.', '<cmd>CodeActionMenu<CR>')
keymap.set('n', '<leader>d', '<cmd>lua diagnostic.open_float()<CR>')
keymap.set('n', '<leader>h', '<cmd>lua lsp.buf.hover()<CR>')

-- NAVIGATION
keymap.set('n', '<leader>e', '<cmd>Ex<CR>')
keymap.set('n', '<leader>}', '<cmd>lua diagnostic.goto_next()<CR>')
keymap.set('n', '<leader>{', '<cmd>lua diagnostic.goto_prev()<CR>')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<leader>]', '<cmd>bn<CR>')
keymap.set('n', '<leader>[', '<cmd>bp<CR>')

-- QUICKFIX
keymap.set('n', '<leader>q', '<cmd>copen<CR>')
keymap.set('n', '<leader>)', '<cmd>cn<CR>')
keymap.set('n', '<leader>(', '<cmd>cp<CR>')

-- PRIME
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("x", "<leader>v", [["_dP]])
