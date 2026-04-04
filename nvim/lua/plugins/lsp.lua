require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'html',
    'emmet_ls',
    'cssls',
    'eslint',
    'jsonls',
    'ts_ls',
    'lua_ls',
    'vue_ls'
  }
})

local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

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
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
    init_options = {
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = vim.fn.expand('$HOME/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin'),
          languages = { 'vue' }
        }
      }
    }
  },
  vue_ls = {
    filetypes = { 'vue' },
    init_options = {
      typescript = {
        tsdk = vim.fn.expand('$HOME/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib')
      }
    }
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

for server_name, config in pairs(servers) do
  config.capabilities = capabilities
  vim.lsp.config(server_name, config)
end

vim.lsp.enable(vim.tbl_keys(servers))
