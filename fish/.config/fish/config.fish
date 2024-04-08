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
alias lf "lfimg"
alias cc "clang"
alias cxx "clang++"
alias tf "terraform"
alias unset 'set --erase'
alias kctx 'kubectx'
alias ssh "TERM=xterm-256color $(which ssh)"
alias kns "kubens | fzf --prompt='Select namespace: ' --height=~50% --layout=reverse --border | xargs kubens"

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

# directory aliases
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias cdd 'cd "$(fd -t d . | fzf)"' # cd with steroids

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

# Rick
alias rick "curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"

# TMUX
alias tls  "tmux ls"              # lists currently running sessions
alias ta   "tmux a"               # attach to any of running session
alias tnew "tmux new -s"          # creates new tmux session
alias tkl  "tmux kill-server"     # kills all tmux sessions
alias tk1  "tmux kill-session -t" # kill specific running session ( specify session name after this command )

# nvim distros
alias nvchad "NVIM_APPNAME=NvChad nvim"
alias lazyvim "NVIM_APPNAME=LazyVim nvim"
alias astrovim "NVIM_APPNAME=AstroNvim nvim"

function nvims
    set items LazyVim AstroNvim NvChad
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config > " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    end
    env NVIM_APPNAME=$config nvim $argv
end

# sessionizer script
bind \cf "tmux-sessionizer"

# Path variables
set PATH "$PATH":"$HOME/go/bin"
set PATH "$PATH":"$HOME/.bun/bin"
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
