local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup {
	defaults = {
		layout_strategy = 'vertical',
		file_ignore_patterns = {
			'node_modules'
		},
		mappings = {
			i = {
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
			},
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		advanced_git_search = {}
	}
}

telescope.load_extension('fzf')
telescope.load_extension('advanced_git_search')
