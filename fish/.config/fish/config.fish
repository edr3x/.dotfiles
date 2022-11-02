set fish_greeting
set TERM "xterm-256color"

# Fish autocomplete and highlight colors
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param '#04cc85'

# alias
alias vi "nvim"
alias vim "nvim"
alias e "thunar ."
alias x "exit"
alias c "clear"
alias logout "pkill -u r3x"
alias ls "exa -a --icons --group-directories-first"
alias ll "exa -lah --icons --color automatic --no-permissions --no-user --no-time --git --group-directories-first"
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias dot "nvim ~/.dotfiles"
alias pgadmin "cd ~/.pgadmin/pgadmin4-6.13/ && source venv/bin/activate && sudo python3 web/pgAdmin4.py"

# protoc ( specify relative path to .proto file after this )
alias protoc-go "protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative" # for golang

# Rick
alias rick "curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"

# Flutter
alias fad "flutter pub add "
set CHROME_EXECUTABLE "$CHROME_EXECUTABLE:/usr/bin/google-chrome"
set PATH "$PATH":"$HOME/.pub-cache/bin"

# TMUX
alias tls "tmux ls" # lists currently running sessions
alias ta "tmux a -t " # attach to any of running session ( specify session name after this command )
alias tkl "tmux kill-server" # kills all tmux sessions
alias tk1 "tmux kill-session -t" # kill specific running session ( specify session name after this command )

# sessionizer script
bind \cf "tmux-sessionizer"

# Path variables
set PATH "$PATH":"$HOME/.local/scripts/"
set PATH "$PATH":"$HOME/.dev/ghcli/bin/"
set PATH "$PATH":"$HOME/.dev/flutter/bin"
set PATH "$PATH":"$HOME/.dev/android-studio/bin"
set PATH "$PATH":"$HOME/.cargo/bin"
set PATH "$PATH":"$HOME/.cargo/env"

if status is-interactive
    # Placeholder
end

starship init fish | source
