set fish_greeting
set fish_color_normal brcyan
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param '#04cc85'
set fish_color_autosuggestion '#7d7d7d'

# me lazy
alias c "clear"
alias k "kubectl"
alias x "exit"
alias vi "nvim"
alias vim "nvim"
alias rm "trash"
alias lf "yazi"
alias cc "clang"
alias cxx "clang++"
alias tf "terraform"
alias unset 'set --erase'
alias ssh "TERM=xterm-256color $(which ssh)"
alias xclip "xclip -selection clipboard"
alias nocaps 'setxkbmap -option "caps:escape"'

# change ownership of file to oneself
alias own 'sudo chown $(id -u):$(id -g)'

# get only status code from curl response
alias cures 'curl -I -s -o /dev/null -w "%{http_code}"'

# utils
alias dot "tmux-sessionizer ~/.dotfiles"
alias fetch "neofetch --config ~/.config/neofetch/config.old.conf"
alias scrkey "screenkey -s small --opacity 0.6 -p fixed -g 30%x7%+69%-2%"
alias nodepurge "find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"

# assume cli
alias ac="source /usr/local/bin/assume.fish -c"
alias at="source /usr/local/bin/assume.fish -t"
alias assume="source /usr/local/bin/assume.fish"

# abbreviation for cd .. alias
function multicd
    set -l length (math (string length -- $argv) - 1)
    echo cd (string repeat -n $length ../)
end

abbr --add dotdot --regex '^\.\.+$' --function multicd

alias cdd 'cd "$(fd -t d . | fzf --prompt="Select directory to jump: " --height=~30% --layout=reverse --border --exit-0)"' # cd with steroids

# better ls
alias ls "exa -a --icons --group-directories-first"
alias ll "exa -lah --icons --no-time --git --group-directories-first"
alias lt "exa -lh --icons --no-user --git -T -L 4 --ignore-glob='.git|node_modules' --group-directories-first --no-permissions --no-filesize --no-time"

# git
alias gd "git diff"
alias gs "git status"
alias ggpush "git push"
alias fuckyou "git push --force"

# docker
alias dps "docker ps"
alias dcd "docker-compose down"
alias dcu "docker-compose up -d"

# kubernetes
alias kns "kubens | fzf --prompt='Select namespace: ' --height=~50% --layout=reverse --border | xargs kubens"
alias kctx "kubectx | fzf --prompt='Select context: ' --height=~50% --layout=reverse --border | xargs kubectx"

# Rick
alias rick "curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"

# TMUX
alias tls  "tmux ls"              # lists currently running sessions
alias ta   "tmux a"               # attach to any of running session
alias tnew "tmux new -s"          # creates new tmux session
alias tkl  "tmux kill-server"     # kills all tmux sessions
alias tk1  "tmux kill-session -t" # kill specific running session ( specify session name after this command )

# sessionizer script
bind \cf "tmux-sessionizer"

# Path variables
set PATH "$PATH":"$HOME/go/bin"
set PATH "$PATH":"$HOME/.bun/bin"
set PATH "$PATH":"$HOME/.krew/bin"
set PATH "$PATH":"$HOME/.local/bin"
set PATH "$PATH":"$HOME/.cargo/bin"
set PATH "$PATH":"$HOME/.cargo/env"
set PATH "$PATH":"$HOME/.local/scripts"
set PATH "$PATH":"$HOME/.local/share/fnm"
set PATH "$PATH":"$HOME/.dev/flutter/bin"
set PATH "$PATH":"$HOME/.dev/android-studio/bin"
set PATH "$PATH":"$HOME/.local/share/bob/nvim-bin"

#pnpm
alias p "pnpm"
alias px "pnpx"
set -gx PNPM_HOME "/home/r3x/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# defaults
export VISUAL="nvim"
export EDITOR="nvim"
export TERM="alacritty"
export KUBECONFIG="$HOME/.kube/config"

fnm env | source
starship init fish | source
