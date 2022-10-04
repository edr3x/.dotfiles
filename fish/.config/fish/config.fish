set fish_greeting

alias vi="nvim"
alias vim="nvim"
alias e="thunar ."
alias x="exit"
alias c="clear"
alias ls="ls --color=auto"
alias dot="nvim ~/.dotfiles"
alias pgadmin="cd ~/.pgadmin/pgadmin4-6.13/ && source venv/bin/activate && sudo python3 web/pgAdmin4.py"

# TMUX
alias tls="tmux ls" # lists currently running sessions
alias ta="tmux a -t " # attach to any of running session ( specify session name after this command )
alias tkl="tmux kill-server" # kills all tmux sessions
alias tk1="tmux kill-session -t" # kill specific running session ( specify session name after this command )

bind \cf "tmux-sessionizer"

# Path variables
set PATH "$PATH:/home/r3x/.local/scripts/"
set PATH "$PATH:/home/r3x/.cargo/bin"
set PATH "$PATH:/home/r3x/.dev/flutter/bin"
set PATH "$PATH:/home/r3x/.dev/android-studio/bin"
set PATH "$PATH:/home/r3x/.dev/ghcli/bin/"
set PATH "$PATH:/home/r3x/.vscode/VSCode-linux-x64/bin/"
set PATH "$PATH":"$HOME/.pub-cache/bin"
set PATH "$PATH":"$HOME/.cargo/env"

if status is-interactive
    # for interractive
end

starship init fish | source
