# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Prompt
eval "$(starship init zsh)"

# Aliases: Version Control
alias ts="tig status"
alias gb="git branch | fzf| xargs git checkout"
alias gp="git push"
alias lg="lazygit"
alias glo="git log --oneline"
alias gcm "git commit -m"
alias gc="deno run --allow-run ~/Dev/scripts/custom-commit.ts"
alias gco="git checkout"
alias git-history="git-file-history"
alias git-reviews="gh search prs --review-requested=@me --state=open"
alias git-prs="gh pr view --web"
alias git-recent="git log --oneline -30 | fzf"
alias git-current="git branch --show-current | pbcopy"
alias git-get="git branch -a | fzf | pbcopy"
alias git-ignore="git update-index --assume-unchanged" # file name
alias git-no-ignore="git update-index --assume-unchanged" # file name

# Aliases: Redirections
alias ls="exa"
alias lsa="exa -a"
alias cat="bat"
alias code="code-insiders"
alias ll="ls -l"

# Aliases: Tool Management
alias aliases="bat ~/.zshrc"
alias zsh-config="nvim ~/.zshrc"
alias zsh-source="source ~/.zshrc"
alias nvim-config="nvim ~/.config/nvim/init.vim"

# Aliases: Lower Level Config
alias keyspeed-read="defaults read -g KeyRepeat -int 1 && defaults read -g InitialKeyRepeat -int 12"
alias keyspeed-write="defaults write -g KeyRepeat -int 1 && defaults write -g InitialKeyRepeat -int 12"
alias get-process-id="sudo lsof -i" # Add :portNumber
alias kill-process="kill -9" # Add PID

# Aliases: Utilities
alias email="open https://mail.google.com/mail/u/0/#inbox && open https://mail.google.com/mail/u/1/#inbox && open https://mail.google.com/mail/u/2/#inbox"
alias dev="npm run dev"
alias test="npm run test:unit"
alias n="fd --hidden --type f --exclude .git | fzf --preview 'bat --theme=Dracula --style=numbers --color=always --line-range :500 {}' | xargs nvim"
alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'