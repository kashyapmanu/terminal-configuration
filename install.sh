#!/bin/bash

# Terminal Configuration Installation Script
# This script will install and configure the complete terminal setup

set -e

echo "🚀 Starting Terminal Configuration Installation..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Detect platform
if [[ "$OSTYPE" == "darwin"* ]]; then
    PLATFORM="macos"
    print_status "macOS detected"
elif command -v apt &> /dev/null; then
    PLATFORM="linux"
    print_status "Linux (Debian/Ubuntu) detected"
else
    print_error "This script supports Debian/Ubuntu Linux or macOS only"
    exit 1
fi

# Update system
print_status "Updating system packages..."
if [[ "$PLATFORM" == "macos" ]]; then
    # Install Homebrew if not present
    if ! command -v brew &> /dev/null; then
        print_status "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew update && brew upgrade
elif [[ "$PLATFORM" == "linux" ]]; then
    sudo apt update && sudo apt upgrade -y
fi

# Install Zsh
print_status "Installing Zsh..."
if [[ "$PLATFORM" == "macos" ]]; then
    brew install zsh
elif [[ "$PLATFORM" == "linux" ]]; then
    sudo apt install -y zsh zsh-common
fi

# Install essential tools
print_status "Installing essential command-line tools..."
if [[ "$PLATFORM" == "macos" ]]; then
    brew install \
        git \
        curl \
        wget \
        fzf \
        eza \
        bat \
        ripgrep \
        htop \
        tmux \
        reattach-to-user-namespace
elif [[ "$PLATFORM" == "linux" ]]; then
    sudo apt install -y \
        git \
        curl \
        wget \
        fzf \
        eza \
        bat \
        ripgrep \
        htop \
        tmux \
        xclip
fi

# Install Oh My Zsh
print_status "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    print_success "Oh My Zsh installed"
else
    print_warning "Oh My Zsh already installed"
fi

# Install Powerlevel10k theme
print_status "Installing Powerlevel10k theme..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    print_success "Powerlevel10k installed"
else
    print_warning "Powerlevel10k already installed"
fi

# Install Zsh plugins
print_status "Installing Zsh plugins..."

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    print_success "zsh-autosuggestions installed"
else
    print_warning "zsh-autosuggestions already installed"
fi

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    print_success "zsh-syntax-highlighting installed"
else
    print_warning "zsh-syntax-highlighting already installed"
fi

# Install Tmux Plugin Manager
print_status "Installing Tmux Plugin Manager..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    print_success "TPM installed"
else
    print_warning "TPM already installed"
fi

# Backup existing configuration files
print_status "Backing up existing configuration files..."
backup_dir="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"

for file in .zshrc .p10k.zsh .tmux.conf; do
    if [ -f "$HOME/$file" ]; then
        cp "$HOME/$file" "$backup_dir/"
        print_status "Backed up $file to $backup_dir/"
    fi
done

# Copy configuration files
print_status "Installing configuration files..."
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Main configuration files
cp "$script_dir/.zshrc" "$HOME/.zshrc"
cp "$script_dir/.p10k.zsh" "$HOME/.p10k.zsh"
cp "$script_dir/.tmux.conf" "$HOME/.tmux.conf"

# Custom Zsh files
cp "$script_dir/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"
cp "$script_dir/dev-env.zsh" "$HOME/.oh-my-zsh/custom/dev-env.zsh"
cp "$script_dir/fzf.zsh" "$HOME/.oh-my-zsh/custom/fzf.zsh"
cp "$script_dir/platform.zsh" "$HOME/.oh-my-zsh/custom/platform.zsh"

print_success "Configuration files installed"

# Set Zsh as default shell
print_status "Setting Zsh as default shell..."
ZSH_PATH=$(which zsh)
if [ "$SHELL" != "$ZSH_PATH" ]; then
    if [[ "$PLATFORM" == "macos" ]]; then
        # Add zsh to allowed shells if not present
        if ! grep -q "$ZSH_PATH" /etc/shells; then
            echo "$ZSH_PATH" | sudo tee -a /etc/shells
        fi
        chsh -s "$ZSH_PATH"
    elif [[ "$PLATFORM" == "linux" ]]; then
        chsh -s "$ZSH_PATH"
    fi
    print_success "Zsh set as default shell"
else
    print_warning "Zsh is already the default shell"
fi

# Install tmux plugins
print_status "Installing tmux plugins..."
if command -v tmux &> /dev/null; then
    # Start tmux in detached mode and install plugins
    tmux new-session -d -s install_plugins
    tmux send-keys -t install_plugins "~/.tmux/plugins/tpm/bin/install_plugins" Enter
    sleep 5
    tmux kill-session -t install_plugins
    print_success "Tmux plugins installed"
fi

print_success "🎉 Terminal configuration installation completed!"
echo ""
print_status "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Run 'p10k configure' to customize your Powerlevel10k theme"
echo "3. Install a Nerd Font for the best experience:"
echo "   - Download from: https://www.nerdfonts.com/"
echo "   - Recommended: MesloLGS NF, Fira Code Nerd Font, or Hack Nerd Font"
echo "4. Configure your terminal emulator to use the installed font"
echo ""
print_warning "Note: You may need to log out and log back in for the shell change to take effect"

if [ -d "$backup_dir" ]; then
    echo ""
    print_status "Your original configuration files have been backed up to: $backup_dir"
fi
