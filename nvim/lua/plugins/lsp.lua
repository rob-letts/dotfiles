require('mason').setup()
require('mason-lspconfig').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

lspconfig.html.setup { capabilities = capabilities }
lspconfig.emmet_ls.setup { capabilities = capabilities }
lspconfig.cssls.setup { capabilities = capabilities }
lspconfig.volar.setup { capabilities = capabilities }
lspconfig.eslint.setup { capabilities = capabilities }
lspconfig.jsonls.setup { capabilities = capabilities }
lspconfig.vuels.setup { capabilities = capabilities }
lspconfig.ts_ls.setup { capabilities = capabilities }

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
