alias vi="nvim"
alias vim="nvim"
alias e="thunar ."
alias x="exit"
alias c="clear"
alias ls="exa -a --icons --group-directories-first"
alias ll="exa -lah --icons --color automatic --no-user --no-time --git --group-directories-first"
alias ..="cd .."
alias ...="cd ../.."

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
