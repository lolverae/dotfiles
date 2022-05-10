# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Exporting PATH variables
export GOROOT=/usr/local/go-1.18
export GOPATH=$HOME/projects/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/projects/go/bin


# Theme
ZSH_THEME="agnoster"

bindkey -v
KEYTIMEOUT=1

# ENABLE lfcd
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# Plugins
plugins=(git colorize
        zsh-autosuggestions
        vi-mode
        zsh-syntax-highlighting
)


source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
alias cat='/usr/local/bin/ccat'
alias c='clear'


# Kubernetes Aliases
alias k="kubectl"
alias h="helm"
alias kdp='kubectl describe pod'
alias ke='kubectl explain'
alias ks='kubectl get namespaces'


# Execute greeting command when opening new instance
curl -s -H "Accept: text/plain" https://icanhazdadjoke.com/ | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)
