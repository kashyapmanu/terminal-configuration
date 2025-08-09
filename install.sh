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

# Check if running on Ubuntu/Debian
if ! command -v apt &> /dev/null; then
    print_error "This script is designed for Ubuntu/Debian systems with apt package manager"
    exit 1
fi

# Update system
print_status "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install Zsh
print_status "Installing Zsh..."
sudo apt install -y zsh zsh-common

# Install essential tools
print_status "Installing essential command-line tools..."
sudo apt install -y \
    git \
    curl \
    wget \
    fzf \
    exa \
    bat \
    ripgrep \
    htop \
    tmux \
    xclip

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

print_success "Configuration files installed"

# Set Zsh as default shell
print_status "Setting Zsh as default shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
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
