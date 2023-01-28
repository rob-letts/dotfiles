# Prompt
eval "$(starship init zsh)"

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Environment Variables
export BAT_THEME="Catppuccin-mocha"
export EDITOR=nvim
export GIT_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export TERM=xterm-256color

# Aliases: Version Control
alias ts="tig status"
alias gb="git branch | fzf | xargs git checkout"
alias gp="git push"
alias glo="git log --oneline"
alias gbd="git branch -D"
alias gco="git checkout"
alias git-history="git-file-history"
alias git-prs="gh pr view --web"
alias git-recent="git log --oneline -30 | fzf"
alias git-current="git branch --show-current | pbcopy"
alias git-get="git branch -a | fzf | pbcopy"
alias git-ignore="git update-index --assume-unchanged" # file name
alias git-no-ignore="git update-index --no-assume-unchanged" # file name

# Aliases: Redirections
alias vim="nvim"
alias ls="exa"
alias lsa="exa -a"
alias cat="bat"
alias ll="ls -l"
alias l="ll -a"

# Aliases: Tool Management
alias n="fzf | xargs nvim"
alias aliases="bat ~/.zshrc"
alias alacritty-config="cd ~/.config/alacritty && nvim"
alias nvim-config="cd ~/.config/nvim && nvim"
alias starship-config="nvim ~/.config/starship.toml"
alias tmux-config="nvim ~/.tmux.conf"
alias tmux-source="tmux source ~/.tmux.conf"
alias zsh-config="nvim ~/.zshrc"
alias zsh-source="source ~/.zshrc"

# Aliases: Lower Level Config
alias mouse-speed="defaults write -g com.apple.mouse.scaling 5.0"
alias keyspeed-read="defaults read -g KeyRepeat -int 1 && defaults read -g InitialKeyRepeat -int 12"
alias keyspeed-write="defaults write -g KeyRepeat -int 1 && defaults write -g InitialKeyRepeat -int 12"
alias get-process-id="sudo lsof -i" # Add :portNumber
alias kill-process="kill -9" # Add PID

# Aliases: Navigation
alias percy="cd ~/Dev"
alias dotfiles="cd ~/Dev/dotfiles"

# Aliases: Utilities
alias dev="npm run dev"
alias lint="npm run lint"
alias test="npm run test:unit"
alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias gc="deno run --allow-run ~/dev/scripts/custom-commit.ts"

# Autocomplete
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi