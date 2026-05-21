fpath=("/Users/rob.letts/.zsh/completions" $fpath)
autoload -Uz compinit
compinit

# Prompt
eval "$(starship init zsh)"

# Environment Variables
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}" --pointer="→" --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'
export EDITOR=nvim
export GIT_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export TERM=xterm-256color

# Aliases: Version Control
alias ts="tig status"
alias gb="git branch | fzf | xargs git checkout"
alias gl="git log --pretty=\"%C(red)%h %Creset%C(yellow)%d %Creset%s %C(cyan)(%ar)%Creset\""
alias glo="git log --oneline"
alias gco="git checkout"
alias git-current="git branch --show-current | pbcopy"
alias git-get="git branch -a | fzf | pbcopy"
alias git-config="nvim ~/.gitconfig"
alias stash="fzf | xargs git stash push"
alias git-clean="git branch | grep -v 'main' | xargs git branch -D"
alias git-diff="git diff | diffnav"

# Aliases: Redirections
alias o="opencode"
alias n="nvim"
alias l="lazygit"
alias vim="nvim"
alias tree="lsd --tree"
alias cat="bat"
alias ls="lsd"
alias lsa="lsd -a"

# Aliases: Tool Management
alias fzfn="fzf | xargs nvim"
alias aliases="bat ~/.zshrc"
alias nvim-config="cd ~/.config/nvim && nvim"
alias starship-config="nvim ~/.config/starship.toml"
alias zsh-config="nvim ~/.zshrc"
alias zsh-source="source ~/.zshrc"
alias claude-config="nvim ~/.claude/CLAUDE.md"

# Aliases: Lower Level Config
alias mouse-speed="defaults write -g com.apple.mouse.scaling 5.0"
alias keyspeed-read="defaults read -g KeyRepeat -int 1 && defaults read -g InitialKeyRepeat -int 12"
alias keyspeed-write="defaults write -g KeyRepeat -int 1 && defaults write -g InitialKeyRepeat -int 12"
alias get-process-id="sudo lsof -i" # Add :portNumber
alias kill-process="kill -9 || echo 'Failed to kill process'" # Add PID

# Aliases: Navigation
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dc="cd ~/Documents"
alias dv="cd ~/Dev"
alias fe="cd ~/Dev/***"
alias be="cd ~/Dev/***"

# Aliases: Utilities
alias raycast="open /Applications/Raycast.app"
alias dist="pnpm run dist"
alias dev="pnpm run open:chrome && pnpm run dev"
alias unit="pnpm run test:unit"
alias be-test="go test ~/Dev/***/..."
alias be-test-log="go test ~/Dev/***/... -v"
alias bail="pnpm vitest run --bail 1"
alias e2e="pnpm run test:playwright"
alias lint="pnpm run lint"

# Autocomplete
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Syntax Highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.local/bin:$PATH"

alias python=python3


# Terminal autocomplete fix
autoload -Uz compinit && compinit


autoload -U +X bashcompinit && bashcompinit

function p() {
  local pr_id
  pr_id=$(gh pr list | fzf --preview 'gh pr view {1}' | awk '{print $1}')
  [[ -n "$pr_id" ]] && gh pr diff "$pr_id" | diffnav
}

# Alias for yazi so exiting it passes the pwd to the parent shell
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
