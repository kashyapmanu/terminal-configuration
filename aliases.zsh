# Custom aliases and functions

# Better ls commands
if command -v exa > /dev/null; then
    alias ls='exa --icons'
    alias ll='exa -l --icons --git'
    alias la='exa -la --icons --git'
    alias tree='exa --tree --icons'
else
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
fi

# Git shortcuts
alias gst='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gp='git push'
alias gl='git pull'
alias glog='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -am'

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# System shortcuts
alias h='history'
alias c='clear'
alias reload='source ~/.zshrc'
alias zshconfig='${EDITOR:-nano} ~/.zshrc'
alias aliases='${EDITOR:-nano} ~/.oh-my-zsh/custom/aliases.zsh'

# Python shortcuts
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate'

# Docker shortcuts (if docker is available)
if command -v docker > /dev/null; then
    alias dps='docker ps'
    alias dpa='docker ps -a'
    alias di='docker images'
    alias dex='docker exec -it'
    alias dlog='docker logs'
    alias dstop='docker stop $(docker ps -q)'
    alias drm='docker rm $(docker ps -aq)'
    alias drmi='docker rmi $(docker images -q)'
fi

# Kubernetes shortcuts (if kubectl is available)
if command -v kubectl > /dev/null; then
    alias k='kubectl'
    alias kgp='kubectl get pods'
    alias kgs='kubectl get services'
    alias kgd='kubectl get deployments'
    alias kdp='kubectl describe pod'
    alias kds='kubectl describe service'
    alias kdd='kubectl describe deployment'
fi

# AWS CLI shortcuts (if aws is available)
if command -v aws > /dev/null; then
    alias awsp='aws configure list-profiles'
    alias awswho='aws sts get-caller-identity'
fi

# Network utilities
alias myip='curl -s https://ipinfo.io/ip'
# Cross-platform ports command
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ports='netstat -anp tcp | grep LISTEN'
else
    alias ports='netstat -tulanp'
fi

# File operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'

# Search and find
if command -v fdfind > /dev/null; then
    alias fd='fdfind'
    alias find='fdfind'
elif command -v fd > /dev/null; then
    alias find='fd'
fi

if command -v rg > /dev/null; then
    alias grep='rg'
fi

# Handle both bat and batcat (Linux vs macOS)
if command -v batcat > /dev/null; then
    alias bat='batcat'
    alias cat='batcat'
    alias less='batcat'
elif command -v bat > /dev/null; then
    alias cat='bat'
    alias less='bat'
fi

# FZF integration
if command -v fzf > /dev/null; then
    # Handle both bat and batcat for preview
    if command -v batcat > /dev/null; then
        alias fzfp='fzf --preview "batcat --color=always --style=numbers --line-range=:500 {}"'
    elif command -v bat > /dev/null; then
        alias fzfp='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
    else
        alias fzfp='fzf --preview "cat {}"'
    fi
    alias fzfd='cd $(find . -type d | fzf)'
fi

# Quick server
alias serve='python3 -m http.server'

# System monitoring
alias top='htop'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# Archive extraction
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Find and kill process
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    if [ "x$pid" != "x" ]; then
        echo $pid | xargs kill -${1:-9}
    fi
}
