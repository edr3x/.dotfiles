set fish_greeting
set TERM "xterm-256color"
# Fish autocomplete and highlight colors

set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param '#04cc85'

# Personal alias
alias vi "nvim"
alias vim "nvim"
alias e "thunar ."
alias x "exit"
alias c "clear"
alias logout "pkill -u r3x"
alias ls "exa -a --icons --no-permissions --no-user --git --group-directories-first"
alias ll "exa -lah --icons --color automatic --no-permissions --no-user --git --group-directories-first"
alias dot "nvim ~/.dotfiles"
alias pgadmin "cd ~/.pgadmin/pgadmin4-6.13/ && source venv/bin/activate && sudo python3 web/pgAdmin4.py"

# Rick
alias rick "curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"

# Flutter
alias fad "flutter pub add "
set CHROME_EXECUTABLE "$CHROME_EXECUTABLE:/usr/bin/google-chrome"

# TMUX
alias tls="tmux ls" # lists currently running sessions
alias ta="tmux a -t " # attach to any of running session ( specify session name after this command )
alias tkl="tmux kill-server" # kills all tmux sessions
alias tk1="tmux kill-session -t" # kill specific running session ( specify session name after this command )

# sessionizer script
bind \cf "tmux-sessionizer"

# Path variables
set PATH "$PATH":"$HOME/.local/scripts/"
set PATH "$PATH":"$HOME/.dev/ghcli/bin/"
set PATH "$PATH":"$HOME/.dev/flutter/bin"
set PATH "$PATH":"$HOME/.dev/android-studio/bin"
set PATH "$PATH":"$HOME/.dev/vscode/VSCode-linux-x64/bin/"
set PATH "$PATH":"$HOME/.cargo/bin"
set PATH "$PATH":"$HOME/.cargo/env"
set PATH "$PATH":"$HOME/.pub-cache/bin"

if status is-interactive
    # Placeholder
end

starship init fish | source
