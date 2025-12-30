require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'html',
    'emmet_ls',
    'cssls',
    'eslint',
    'jsonls',
    'ts_ls',
    'lua_ls'
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

-- Configure LSP servers using vim.lsp.config (Neovim 0.11+)
local servers = {
  html = {
    filetypes = { 'html' }
  },
  emmet_ls = {
    filetypes = { 'html', 'css', 'scss', 'vue' }
  },
  cssls = {
    filetypes = { 'css', 'scss' }
  },
  eslint = {
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' }
  },
  jsonls = {
    filetypes = { 'json' }
  },
  ts_ls = {
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' }
  },
  volar = {
    filetypes = { 'vue' }
  },
  lua_ls = {
    filetypes = { 'lua' },
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  }
}

-- Register each server configuration
for server_name, config in pairs(servers) do
  config.capabilities = capabilities
  vim.lsp.config(server_name, config)
end
