require'mason'.setup()
require'mason-lspconfig'.setup()
require'nvim-ts-autotag'.setup()
require'neoclip'.setup()
require'Comment'.setup()
require'treesitter-context'.setup()
require'twilight'.setup()
require'startup'.setup()
require'which-key'.setup()

require'telescope'.setup{
 	defaults = {
		layout_strategy = 'vertical',
		file_ignore_patterns = {
			'node_modules'
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		}
	}
}

require'telescope'.load_extension'fzf'
require'telescope'.load_extension'neoclip'
require'telescope'.load_extension'file_browser'

local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol',
			maxwidth = 50,
			ellipsis_char = '...'
		})
	}
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup LSP Config.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'['html'].setup { capabilities = capabilities }
require'lspconfig'['cssls'].setup { capabilities = capabilities }
require'lspconfig'['emmet_ls'].setup { capabilities = capabilities }
require'lspconfig'['volar'].setup { capabilities = capabilities }
require'lspconfig'['eslint'].setup { capabilities = capabilities }
require'lspconfig'['jsonls'].setup { capabilities = capabilities }
require'lspconfig'['tsserver'].setup { capabilities = capabilities }

local navic = require("nvim-navic")
require('lspconfig').clangd.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}

-- Currently not working
-- require'barbecue'.setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "css", "vue", "typescript", "javascript" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
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

vim.cmd [[ colorscheme dracula ]]
vim.diagnostic.config({ virtual_text = false })
vim.g['airline#extensions#whitespace#enabled'] = 0
vim.g['airline#extensions#default#layout'] = {{ 'a', 'c' }, { 'x', 'b' }}

