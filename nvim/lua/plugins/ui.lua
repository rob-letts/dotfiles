vim.diagnostic.config({ virtual_text = false })

require('catppuccin').setup({
    no_italic = true,
    flavour = "mocha"
})

vim.cmd.colorscheme "catppuccin"
