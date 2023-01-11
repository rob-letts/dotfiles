-- TODO: Lazy load optional plugins
-- TODO: New theme? Improve Vue syntax highlighting

require('set')
require('remap')
require('plugins')

require('plugins.treesitter')
require('plugins.lsp')
require('plugins.completion')
require('plugins.navigation')
require('plugins.utilities')
require('plugins.ui')
require('plugins.statusline')
