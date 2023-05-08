require('lualine').setup{
    options = {
	section_separators = { left = '', right = ' ' },
	component_separators = { left = '', right = '' }
    },
    sections = {
	lualine_a = {'mode'},
	lualine_b = {''},
	lualine_c = {'filetype'},
	lualine_x = {'diagnostics'},
	lualine_y = {''},
	lualine_z = {'branch'}
    }
}
