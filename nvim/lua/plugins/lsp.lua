require('mason').setup()
require('mason-lspconfig').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

-- Configure LSP servers using vim.lsp.config
local servers = {
  html = {},
  emmet_ls = {},
  cssls = {},
  volar = {},
  eslint = {},
  jsonls = {},
  vuels = {},
  ts_ls = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  }
}

-- Set up each server
for server_name, config in pairs(servers) do
  config.capabilities = capabilities
  vim.lsp.config(server_name, config)
end
