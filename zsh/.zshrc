[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

alias vi="nvim"
alias vim="nvim"
alias e="thunar ."
alias x="exit"
alias ls="ls --color=auto"
alias tls="tmux ls"
alias ta="tmux a -t "
alias dot="nvim ~/.dotfiles"

bindkey -s ^f "tmux-sessionizer\n"

PATH="$PATH:/home/r3x/.local/scripts/"
PATH="$PATH:/home/r3x/.cargo/bin"
PATH="$PATH:/home/r3x/.dev/flutter/bin"
PATH="$PATH:/home/r3x/.dev/android-studio/bin"
PATH="$PATH:/home/r3x/.dev/ghcli/bin/"
PATH="$PATH:/home/r3x/.vscode/VSCode-linux-x64/bin/"
PATH="$PATH":"$HOME/.pub-cache/bin"
. "$HOME/.cargo/env"
CHROME_EXECUTABLE="$PATH:/usr/bin/google-chrome-stable"

alias pgadmin="cd ~/.pgadmin/pgadmin4-6.13/ && source venv/bin/activate && sudo python3 web/pgAdmin4.py"

eval "$(starship init zsh)"
