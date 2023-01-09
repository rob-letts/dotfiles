local cmp = require'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require'lspkind'
local luasnip = require'luasnip'

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

cmp.setup({
    snippet = {
	expand = function(args)
	    luasnip.lsp_expand(args.body)
	end,
    },
    window = {
	completion = cmp.config.window.bordered(),
	documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
	['<C-Space>'] = cmp.mapping.complete(),
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
