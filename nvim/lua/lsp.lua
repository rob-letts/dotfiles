require'mason'.setup()
require'mason-lspconfig'.setup()
require'treesitter-context'.setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require'lspconfig'

lspconfig['html'].setup { capabilities = capabilities }
lspconfig['cssls'].setup { capabilities = capabilities }
lspconfig['emmet_ls'].setup { capabilities = capabilities }
lspconfig['volar'].setup { capabilities = capabilities }
lspconfig['eslint'].setup { capabilities = capabilities }
lspconfig['jsonls'].setup { capabilities = capabilities }
lspconfig['tsserver'].setup { capabilities = capabilities }

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
		"html", "css", "javascript", "json", "markdown", "scss", "typescript", "vim", "vue", "lua"
	},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}
