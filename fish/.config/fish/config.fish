set fish_greeting
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param '#04cc85'

alias vi "nvim"
alias vim "nvim"
alias lf "lfimg"
alias e "thunar ."
alias x "exit"
alias c "clear"
alias rm "trash"
alias ls "exa -a --icons --group-directories-first"
alias ll "exa -lah --icons --color automatic --no-user --no-time --git --group-directories-first"
alias cc "clang"
alias cxx "clang++"
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias dot "tmux-sessionizer ~/.dotfiles"
alias fuckyou "git push --force"
alias fetch "neofetch --config ~/.config/neofetch/config.old.conf"
alias nodepurge "find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"

alias idea "~/.dev/idea/bin/idea.sh"

# Rick
alias rick "curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"

# TMUX
alias tnew "tmux new -s"          # creates new tmux session
alias tls  "tmux ls"              # lists currently running sessions
alias ta   "tmux a -t "           # attach to any of running session ( specify session name after this command )
alias tkl  "tmux kill-server"     # kills all tmux sessions
alias tk1  "tmux kill-session -t" # kill specific running session ( specify session name after this command )

# sessionizer script
bind \cf "tmux-sessionizer"

# Path variables
set PATH "$PATH":"$HOME/.local/scripts/"
set PATH "$PATH":"$HOME/.dev/flutter/bin"
set PATH "$PATH":"$HOME/.dev/android-studio/bin"
set PATH "$PATH":"$HOME/.cargo/bin"
set PATH "$PATH":"$HOME/.cargo/env"
set PATH "$PATH":"$HOME/.bun/bin"
set PATH "$PATH":"$HOME/go/bin"

#pnpm
alias p "pnpm"
alias px "pnpx"
set -gx PNPM_HOME "/home/r3x/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

export TERM="alacritty"
export EDITOR="nvim"
export VISUAL="nvim"

starship init fish | source
