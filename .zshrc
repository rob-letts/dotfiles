
# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Prompt
eval "$(starship init zsh)"

# Aliases: Version Control
alias pr="gh pr create && gh pr edit"
alias ts="tig status"
alias gb="git branch | fzf| xargs git checkout"
alias gp="git push"
alias lg="lazygit"
alias glo="git log --oneline"
alias gbd="git branch -D"
alias gco="git checkout"
alias git-history="git-file-history"
alias git-reviews="gh search prs --review-requested=@me --state=open"
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
alias aliases="bat ~/.zshrc"
alias zsh-config="nvim ~/.zshrc"
alias zsh-source="source ~/.zshrc"
alias nvim-config="cd ~/.config/nvim && nvim init.vim"
alias starship-config="nvim ~/.config/starship.toml"

# Aliases: Lower Level Config
alias keyspeed-read="defaults read -g KeyRepeat -int 1 && defaults read -g InitialKeyRepeat -int 12"
alias keyspeed-write="defaults write -g KeyRepeat -int 1 && defaults write -g InitialKeyRepeat -int 12"
alias get-process-id="sudo lsof -i" # Add :portNumber
alias kill-process="kill -9" # Add PID

# Aliases: Navigation
alias percy="cd ~/Dev"

# Aliases: Utilities
alias dev="npm run dev"
alias lint="npm run lint"
alias test="npm run test:unit"
alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias riv-m="cowsay -f turtle \"Hi River!\" && say"
alias riv-f="cowsay -f turtle \"Hi River!\" && say --voice=samantha"

# Aliases: Scripts
alias gc="deno run --allow-run ~/Scripts/custom-commit.ts"

# Autocomplete
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export GIT_EDITOR='vim'
export VISUAL='vim'
export EDITOR='vim'
export TERM=xterm-256color

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
