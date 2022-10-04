set fish_greeting

alias vi="nvim"
alias vim="nvim"
alias e="thunar ."
alias x="exit"
alias ls="ls --color=auto"
alias tls="tmux ls"
alias ta="tmux a -t "
alias dot="nvim ~/.dotfiles"
alias pgadmin="cd ~/.pgadmin/pgadmin4-6.13/ && source venv/bin/activate && sudo python3 web/pgAdmin4.py"

bind \cf "tmux-sessionizer"

set PATH "$PATH:/home/r3x/.local/scripts/"
set PATH "$PATH:/home/r3x/.cargo/bin"
set PATH "$PATH:/home/r3x/.dev/flutter/bin"
set PATH "$PATH:/home/r3x/.dev/android-studio/bin"
set PATH "$PATH:/home/r3x/.dev/ghcli/bin/"
set PATH "$PATH:/home/r3x/.vscode/VSCode-linux-x64/bin/"
set PATH "$PATH":"$HOME/.pub-cache/bin"
set PATH "$PATH":"$HOME/.cargo/env"

if status is-interactive
    starship init fish | source
end


