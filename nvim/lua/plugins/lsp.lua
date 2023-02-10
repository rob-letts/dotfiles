require('mason').setup()
require('mason-lspconfig').setup()
local navic = require('nvim-navic')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')


local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

lspconfig['html'].setup {  capabilities = capabilities, on_attach = on_attach }
lspconfig['emmet_ls'].setup {  capabilities = capabilities, on_attach = on_attach }
lspconfig['cssls'].setup {  capabilities = capabilities, on_attach = on_attach }
lspconfig['tsserver'].setup {  capabilities = capabilities, on_attach = on_attach }
lspconfig['eslint'].setup {  capabilities = capabilities, on_attach = on_attach }
lspconfig['volar'].setup { capabilities = capabilities, on_attach = on_attach }
lspconfig['jsonls'].setup {  capabilities = capabilities, on_attach = on_attach }
