require('mason').setup()
require('mason-lspconfig').setup()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

lspconfig.html.setup { capabilities = capabilities }
lspconfig.emmet_ls.setup { capabilities = capabilities }
lspconfig.astro.setup { capabilities = capabilities }
lspconfig.cssls.setup { capabilities = capabilities }
lspconfig.volar.setup { capabilities = capabilities }
lspconfig.eslint.setup { capabilities = capabilities }
lspconfig.jsonls.setup { capabilities = capabilities }
lspconfig.zls.setup { capabilities = capabilities }

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}


lspconfig.denols.setup {
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  settings = {
    deno = {
      enable = true,
      unstable = true,
      lint = true
    }
  }
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false
}
