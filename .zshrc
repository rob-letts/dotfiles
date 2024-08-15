# Prompt
eval "$(starship init zsh)"

source ~/.work-env

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Environment Variables
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}" --pointer="→" --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'
export BAT_THEME="Catppuccin-mocha"
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
alias ignore="git update-index --assume-unchanged" # file name
alias no-ignore="git update-index --no-assume-unchanged" # file name

# Aliases: Redirections
alias vim="nvim"
alias ls="exa --icons -l"
alias lsa="ls -a"
alias lsf="lsd -d */"
alias tree="lsd --tree"
alias cat="bat"
alias lg="lazygit"
alias ld="lazydocker"
alias z="zellij attach --create dev"

# Aliases: Tool Management
alias fzfn="fzf | xargs nvim"
alias aliases="bat ~/.zshrc"
alias nvim-config="cd ~/.config/nvim && nvim"
alias zellij-config="nvim ~/.config/zellij"
alias starship-config="nvim ~/.config/starship.toml"
alias zsh-config="nvim ~/.zshrc"
alias zsh-source="source ~/.zshrc"

# Aliases: Lower Level Config
alias mouse-speed="defaults write -g com.apple.mouse.scaling 5.0"
alias keyspeed-read="defaults read -g KeyRepeat -int 1 && defaults read -g InitialKeyRepeat -int 12"
alias keyspeed-write="defaults write -g KeyRepeat -int 1 && defaults write -g InitialKeyRepeat -int 12"
alias get-process-id="sudo lsof -i" # Add :portNumber
alias kill-process="kill -9" # Add PID

# Aliases: Navigation
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dc="cd ~/Documents"
alias dv="cd ~/Dev"
alias percy="cd ~/Personal"

# Aliases: Utilities
alias wipe="rm ~/Desktop/Screen*"
alias raycast="open /Applications/Raycast.app"
alias dist="npm run dist"
alias dev="npm run dev"
alias e2e="npm run test:e2e"
alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias search="Rg . | fzf"
alias lint="npm run lint"
alias turtle="cowsay -f turtle $my_message && say --voice=\"Samantha\" $my_message"

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

source /Users/rob/.docker/init-zsh.sh || true # Added by Docker Desktop
