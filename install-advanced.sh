#!/bin/bash

# Advanced Terminal Configuration Enhancement Script
# This script adds advanced tools and features to your existing setup

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() { echo -e "${BLUE}[INFO]${NC} $1"; }
print_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
print_error() { echo -e "${RED}[ERROR]${NC} $1"; }

echo "🚀 Installing Advanced Terminal Enhancements..."

# Check if base setup exists
if [ ! -f "$HOME/.zshrc" ] || [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_error "Base terminal configuration not found. Please run ./install.sh first."
    exit 1
fi

# Install modern CLI tools
print_status "Installing modern CLI replacements..."
sudo apt update
sudo apt install -y \
    fd-find \
    tree \
    ncdu \
    tldr \
    jq \
    neofetch \
    cowsay \
    fortune \
    lolcat \
    figlet \
    cmatrix \
    curl \
    wget

# Install additional tools via snap (if available)
if command -v snap &> /dev/null; then
    print_status "Installing snap packages..."
    sudo snap install yq
fi

# Install Rust-based tools (if Rust is available)
if command -v cargo &> /dev/null; then
    print_status "Installing Rust-based tools..."
    cargo install \
        procs \
        dust \
        duf \
        broot \
        zoxide \
        delta
fi

# Install Node Version Manager (NVM)
print_status "Installing Node Version Manager (NVM)..."
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    print_success "NVM installed"
else
    print_warning "NVM already installed"
fi

# Install additional Zsh plugins
print_status "Installing additional Zsh plugins..."
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# zsh-z (directory jumping)
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-z" ]; then
    git clone https://github.com/agkozak/zsh-z.git "$ZSH_CUSTOM/plugins/zsh-z"
    print_success "zsh-z installed"
fi

# zsh-autopair
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autopair" ]; then
    git clone https://github.com/hlissner/zsh-autopair.git "$ZSH_CUSTOM/plugins/zsh-autopair"
    print_success "zsh-autopair installed"
fi

# zsh-completions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]; then
    git clone https://github.com/zsh-users/zsh-completions.git "$ZSH_CUSTOM/plugins/zsh-completions"
    print_success "zsh-completions installed"
fi

# you-should-use
if [ ! -d "$ZSH_CUSTOM/plugins/you-should-use" ]; then
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$ZSH_CUSTOM/plugins/you-should-use"
    print_success "you-should-use installed"
fi

# Install Nerd Fonts
print_status "Installing additional Nerd Fonts..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
cd "$FONT_DIR"

# Download popular fonts if they don't exist
fonts=("FiraCode" "Hack" "JetBrainsMono")
for font in "${fonts[@]}"; do
    if [ ! -f "${font}.zip" ] && [ ! -d "${font}" ]; then
        print_status "Downloading $font Nerd Font..."
        wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/${font}.zip" || print_warning "Failed to download $font"
        if [ -f "${font}.zip" ]; then
            unzip -q "${font}.zip" -d "${font}/"
            rm "${font}.zip"
        fi
    fi
done

# Update font cache
fc-cache -fv > /dev/null 2>&1
print_success "Fonts installed and cache updated"

# Create enhanced aliases file
print_status "Creating enhanced aliases..."
cat >> "$ZSH_CUSTOM/aliases-advanced.zsh" << 'EOF'
# Advanced aliases and functions

# Modern tool replacements
if command -v fd > /dev/null; then
    alias find='fd'
fi

if command -v procs > /dev/null; then
    alias ps='procs'
fi

if command -v dust > /dev/null; then
    alias du='dust'
fi

if command -v duf > /dev/null; then
    alias df='duf'
fi

if command -v zoxide > /dev/null; then
    eval "$(zoxide init zsh)"
    alias cd='z'
fi

# System monitoring
alias cpu='top -o cpu'
alias mem='top -o rsize'
alias ports='lsof -i -P -n | grep LISTEN'
alias myip='curl -s ifconfig.me'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'

# Enhanced git aliases
alias glog='git log --oneline --decorate --graph --all'
alias gstash='git stash push -m'
alias gunstash='git stash pop'
alias gclean='git clean -fd'
alias greset='git reset --hard HEAD'

# Docker enhancements
if command -v docker > /dev/null; then
    alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
    alias dclean='docker system prune -af'
    alias dlog='docker logs -f'
fi

# Docker Compose shortcuts
if command -v docker-compose > /dev/null; then
    alias dc='docker-compose'
    alias dcu='docker-compose up'
    alias dcd='docker-compose down'
    alias dcb='docker-compose build'
    alias dcl='docker-compose logs -f'
    alias dcp='docker-compose ps'
    alias dcr='docker-compose restart'
fi

# Development shortcuts
alias serve='python3 -m http.server 8000'
alias jsonpp='python3 -m json.tool'
alias urlencode='python3 -c "import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]))"'
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'

# Network utilities
alias ping='ping -c 5'
alias wget='wget -c'

# Fun aliases
alias matrix='cmatrix -s -C cyan'
alias starwars='telnet towel.blinkenlights.nl'
alias fortune='fortune | cowsay | lolcat'

# Enhanced functions
weather() {
    curl -s "wttr.in/$1?format=3"
}

note() {
    echo "$(date): $*" >> "$HOME/notes.txt"
}

notes() {
    cat "$HOME/notes.txt"
}

psg() {
    ps aux | grep -v grep | grep "$1" -i --color=auto
}

serve_port() {
    local port=${1:-8000}
    python3 -m http.server "$port"
}

timer() {
    local N=$1
    echo "Timer started for $N seconds"
    sleep $N && echo "Time's up!" && (command -v notify-send > /dev/null && notify-send "Timer" "Time's up!" || echo "🔔 Timer finished!")
}

pomodoro() {
    echo "🍅 Pomodoro started (25 minutes)"
    sleep 1500 && echo "🍅 Pomodoro complete! Take a 5-minute break." && (command -v notify-send > /dev/null && notify-send "Pomodoro" "Time for a break!" || echo "🔔 Break time!")
}

mkproject() {
    local project_name=$1
    mkdir -p "$project_name"
    cd "$project_name"
    git init
    echo "# $project_name" > README.md
    echo "node_modules/\n.env\n*.log\n.DS_Store" > .gitignore
    echo "Project $project_name created and initialized!"
}

backup_configs() {
    local backup_dir="$HOME/config_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    
    cp ~/.zshrc "$backup_dir/" 2>/dev/null
    cp ~/.p10k.zsh "$backup_dir/" 2>/dev/null
    cp ~/.tmux.conf "$backup_dir/" 2>/dev/null
    cp -r ~/.oh-my-zsh/custom "$backup_dir/" 2>/dev/null
    cp ~/.gitconfig "$backup_dir/" 2>/dev/null
    
    echo "Configurations backed up to $backup_dir"
}
EOF

print_success "Enhanced aliases created"

# Update .zshrc to include new plugins
print_status "Updating .zshrc with new plugins..."
if ! grep -q "zsh-z" ~/.zshrc; then
    # Create a backup
    cp ~/.zshrc ~/.zshrc.backup

    # Add new plugins to the plugins array
    sed -i '/plugins=(/,/)/{
        /zsh-syntax-highlighting/a\    zsh-z\
    zsh-autopair\
    zsh-completions\
    you-should-use
    }' ~/.zshrc
    
    print_success "Plugins added to .zshrc"
fi

# Create development environment enhancements
print_status "Creating enhanced development environment..."
cat >> "$ZSH_CUSTOM/dev-env-advanced.zsh" << 'EOF'
# Advanced Development Environment Configuration

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Node.js enhancements
if command -v node > /dev/null; then
    export NODE_OPTIONS="--max-old-space-size=4096"
    export NPM_CONFIG_PREFIX="$HOME/.npm-global"
    export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"
    
    # npm aliases
    alias ni='npm install'
    alias nid='npm install --save-dev'
    alias nig='npm install -g'
    alias nr='npm run'
    alias ns='npm start'
    alias nt='npm test'
    alias nb='npm run build'
fi

# Rust environment
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# Zoxide initialization
if command -v zoxide > /dev/null; then
    eval "$(zoxide init zsh)"
fi

# Delta git pager
if command -v delta > /dev/null; then
    export GIT_PAGER="delta"
fi

# Performance monitoring
alias cpu_usage="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$3+\$4+\$5)} END {print usage \"%\"}'"
alias memory_usage="free | grep Mem | awk '{printf(\"%.2f%%\", \$3/\$2 * 100.0)}'"

# Better ls with exa
if command -v exa > /dev/null; then
    alias ls='exa --icons --group-directories-first'
    alias ll='exa -l --icons --group-directories-first --git'
    alias la='exa -la --icons --group-directories-first --git'
    alias tree='exa --tree --icons --group-directories-first'
fi
EOF

print_success "Enhanced development environment created"

# Create SSH config for better security
print_status "Creating SSH configuration..."
mkdir -p ~/.ssh
if [ ! -f ~/.ssh/config ]; then
    cat > ~/.ssh/config << 'EOF'
Host *
    ServerAliveInterval 60
    ServerAliveCountMax 3
    ControlMaster auto
    ControlPath ~/.ssh/master-%r@%h:%p
    ControlPersist 10m
    AddKeysToAgent yes
EOF
    chmod 600 ~/.ssh/config
    print_success "SSH config created"
else
    print_warning "SSH config already exists"
fi

# Create a system info display function
print_status "Creating system info display..."
cat > "$HOME/.local/bin/sysinfo" << 'EOF'
#!/bin/bash
echo "🖥️  System Information"
echo "===================="
echo "OS: $(lsb_release -d | cut -f2)"
echo "Kernel: $(uname -r)"
echo "Shell: $SHELL"
echo "Terminal: $TERM"
echo "CPU: $(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)"
echo "Memory: $(free -h | grep '^Mem:' | awk '{print $3 "/" $2}')"
echo "Disk: $(df -h / | tail -1 | awk '{print $3 "/" $2 " (" $5 " used)"}')"
echo "Uptime: $(uptime -p)"
echo "Load: $(uptime | awk -F'load average:' '{print $2}')"
echo ""
if command -v neofetch > /dev/null; then
    neofetch --ascii_distro ubuntu_small
fi
EOF

chmod +x "$HOME/.local/bin/sysinfo"
print_success "System info script created (run 'sysinfo' to use)"

print_success "🎉 Advanced enhancements installation completed!"
echo ""
print_status "What's new:"
echo "• Modern CLI tools: fd, procs, dust, duf, zoxide"
echo "• Additional Zsh plugins: zsh-z, autopair, completions, you-should-use"
echo "• Enhanced aliases and functions in aliases-advanced.zsh"
echo "• Development environment improvements"
echo "• Additional Nerd Fonts installed"
echo "• SSH security configuration"
echo "• System info script (run 'sysinfo')"
echo ""
print_status "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Try new commands: z (smart cd), fd (find), procs (ps)"
echo "3. Use new functions: weather <city>, note <text>, timer <seconds>"
echo "4. Run 'sysinfo' to see system information"
echo "5. Configure your terminal font to one of the new Nerd Fonts"
echo ""
print_warning "Note: Some tools may require a terminal restart to work properly"
