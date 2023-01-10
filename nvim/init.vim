source ~/.config/nvim/set.vim
source ~/.config/nvim/remap.vim
source ~/.config/nvim/vim-plug.vim

lua << EOF
require('plugins.lsp')
require('plugins.completion')
require('plugins.navigation')
require('plugins.ui')
require('plugins.utilities')
EOF
