local navic = require("nvim-navic")

require('lualine').setup{
    options = {
	section_separators = { left = '', right = '' },
	component_separators = { left = '', right = '' }
    },
    sections = {
	lualine_a = { 'mode' },
	lualine_b = { '' },
	lualine_c = {
            { navic.get_location, cond = navic.is_available },
	},
	lualine_x = { '' },
	lualine_y = { '' },
	lualine_z = { 'branch' }
    },
}
