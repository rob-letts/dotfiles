source ~/.config/nvim/set.vim
source ~/.config/nvim/remap.vim
source ~/.config/nvim/vim-plug.vim

lua require('plugins.lsp')
lua require('plugins.completion')
lua require('plugins.navigation')
lua require('plugins.ui')
lua require('plugins.utilities')
