require('mason').setup()
require('mason-lspconfig').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig['html'].setup { capabilities = capabilities }
lspconfig['emmet_ls'].setup { capabilities = capabilities }
lspconfig['cssls'].setup { capabilities = capabilities }
lspconfig['tsserver'].setup { capabilities = capabilities }
lspconfig['eslint'].setup { capabilities = capabilities }
lspconfig['volar'].setup { capabilities = capabilities }
lspconfig['jsonls'].setup { capabilities = capabilities }
lspconfig['rust_analyzer'].setup { capabilities = capabilities }
