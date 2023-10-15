alias vi="nvim"
alias vim="nvim"
alias e="thunar ."
alias x="exit"
alias c="clear"
alias k="kubectl"
alias tf="terraform"
alias ls="exa -a --icons --group-directories-first"
alias ll="exa -lah --icons --color automatic --no-time --git --group-directories-first"
alias lt="exa -lh --icons --color automatic --no-user --git -T -L 4 --ignore-glob='.git|node_modules' --group-directories-first --no-permissions --no-filesize --no-time"

alias ..="cd .."
alias ...="cd ../.."
alias cdd='cd "$(fd -t d . | fzf)"'

# TMUX
alias tls="tmux ls"
alias ta="tmux a -t "
alias tnew="tmux new -s"
alias tkl="tmux kill-server"
alias tk1="tmux kill-session -t"

bindkey -s ^f "tmux-sessionizer\n"

export TERM="alacritty"
export EDITOR="nvim"
export VISUAL="nvim"
export KUBECONFIG=~/.kube/config

eval "$(starship init zsh)"
