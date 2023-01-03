require'startup'.setup()

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
