# Neovim Plugins

| Plugin | Repo | Purpose | Required By |
|--------|------|---------|-------------|
| **lazy.nvim** | [folke/lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager | — |
| **nvim-treesitter** | [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting & parsing | — |
| **nvim-lspconfig** | [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configuration | — |
| **mason.nvim** | [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/DAP/linter installer UI | nvim-lspconfig |
| **mason-lspconfig.nvim** | [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridge between mason and lspconfig | nvim-lspconfig |
| **blink.cmp** | [saghen/blink.cmp](https://github.com/saghen/blink.cmp) | Completion engine (LSP, buffer, path, snippets, cmdline built-in) | — |
| **LuaSnip** | [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine | blink.cmp |
| **nvim-autopairs** | [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets & quotes during typing | — |
| **nvim-ts-autotag** | [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | Auto-close/rename HTML & JSX tags | — |
| **nvim-surround** | [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) | Surround text objects (ys/ds/cs) — Lua rewrite of vim-surround | — |
| **plenary.nvim** | [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library | telescope.nvim |
| **telescope.nvim** | [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder | — |
| **telescope-fzf-native.nvim** | [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | Native fzf sorter for telescope | telescope.nvim |
| **catppuccin** | [catppuccin/nvim](https://github.com/catppuccin/nvim) | Colorscheme (mocha flavour) | — |
| **lualine.nvim** | [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line | — |
| **nvim-web-devicons** | [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File type icons | lualine.nvim, snacks.nvim |
| **lazydev.nvim** | [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim) | Neovim Lua API types & completion for lua_ls (lua ft only) | — |
| **render-markdown.nvim** | [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Renders markdown in-buffer with concealment | — |
| **snacks.nvim** | [folke/snacks.nvim](https://github.com/folke/snacks.nvim) | QoL utilities — dashboard, notifier, lazygit | claudecode.nvim |
| **claudecode.nvim** | [coder/claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code AI assistant integration | — |
| **copilot.vim** | [github/copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot inline completions | — |
| **vim-sleuth** | [tpope/vim-sleuth](https://github.com/tpope/vim-sleuth) | Auto-detect indent settings | — |
| **targets.vim** | [wellle/targets.vim](https://github.com/wellle/targets.vim) | Enhanced text objects | — |
| **numb.nvim** | [nacro90/numb.nvim](https://github.com/nacro90/numb.nvim) | Peek line preview when typing `:N` | — |
| **nvim-ghost.nvim** | [subnut/nvim-ghost.nvim](https://github.com/subnut/nvim-ghost.nvim) | Edit browser text areas in Neovim | — |

## Removed plugins

| Plugin | Reason |
|--------|--------|
| **popup.nvim** | Deprecated — no longer needed by telescope |
| **cmp-nvim-lua** | Too niche (nvim Lua API completion) |
| **cmp-buffer**, **cmp-path**, **cmp-nvim-lsp**, **cmp-cmdline**, **cmp_luasnip** | Replaced by blink.cmp (sources built-in) |
| **nvim-cmp** | Replaced by blink.cmp |
| **lspkind.nvim** | Replaced by blink.cmp built-in kind icons |
| **Comment.nvim** | Replaced by Neovim 0.10+ native `gc`/`gcc` |
| **vim-surround** | Replaced by nvim-surround (Lua rewrite) |
| **vim-repeat** | No longer needed — nvim-surround has built-in dot-repeat |
| **alpha-nvim** | Replaced by snacks.nvim dashboard (unmaintained) — commented out in plugins.lua for easy rollback |
