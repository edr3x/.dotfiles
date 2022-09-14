export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(
    fzf
    git
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
)

source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias vim="nvim"
alias e="thunar ."
alias ls="ls --color=auto"

PATH="$PATH:/home/r3x/.dev/flutter/bin"
PATH="$PATH:/home/r3x/.dev/android-studio/bin"
PATH="$PATH:/home/r3x/.vscode/VSCode-linux-x64/bin/"
PATH="$PATH":"$HOME/.pub-cache/bin"
CHROME_EXECUTABLE="$PATH:/usr/bin/google-chrome-stable"

alias pgadmin="cd ~/.pgadmin/pgadmin4-6.13/ && source venv/bin/activate && sudo python3 web/pgAdmin4.py"

eval "$(starship init zsh)"
