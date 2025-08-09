# Quick Setup Guide

This is a condensed version of the setup process for experienced users.

## One-Line Installation

```bash
curl -fsSL https://raw.githubusercontent.com/your-repo/terminal-configuration/main/install.sh | bash
```

Or clone and run locally:

```bash
git clone <this-repo>
cd terminal-configuration
./install.sh
```

## Manual Installation (5 minutes)

### 1. Install Base Packages
```bash
sudo apt update && sudo apt install -y zsh git curl fzf exa bat ripgrep htop tmux xclip
```

### 2. Install Oh My Zsh + Powerlevel10k
```bash
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### 3. Install Zsh Plugins
```bash
# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### 4. Install TPM (Tmux Plugin Manager)
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 5. Copy Configuration Files
```bash
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
cp .tmux.conf ~/.tmux.conf
cp aliases.zsh ~/.oh-my-zsh/custom/
cp dev-env.zsh ~/.oh-my-zsh/custom/
cp fzf.zsh ~/.oh-my-zsh/custom/
```

### 6. Set Zsh as Default & Install Tmux Plugins
```bash
chsh -s $(which zsh)
tmux new -d && tmux send-keys "~/.tmux/plugins/tpm/bin/install_plugins" Enter && tmux kill-server
```

### 7. Restart Terminal
```bash
source ~/.zshrc
p10k configure  # Optional: customize theme
```

## Essential Post-Setup

1. **Install a Nerd Font**: Download from [nerdfonts.com](https://www.nerdfonts.com/)
2. **Configure Terminal**: Set font to the installed Nerd Font
3. **Customize**: Run `p10k configure` for theme customization

## Key Features You'll Get

- **Enhanced prompt** with git status, execution time, and more
- **Smart autosuggestions** based on history
- **Syntax highlighting** for commands
- **Fuzzy finding** with FZF integration
- **Modern tools**: exa (ls), bat (cat), ripgrep (grep)
- **Tmux** with mouse support and clipboard integration
- **100+ aliases** for common tasks

## Troubleshooting

- **Fonts look broken**: Install and configure a Nerd Font
- **Plugins not working**: Restart terminal or run `omz reload`
- **Tmux plugins missing**: Press `Ctrl-b + I` in tmux
- **Permission issues**: Check file permissions with `ls -la`

## File Structure
```
terminal-configuration/
├── README.md           # Complete documentation
├── QUICK_SETUP.md      # This file
├── SYSTEM_INFO.md      # System details
├── install.sh          # Automated installer
├── .zshrc             # Main zsh configuration
├── .p10k.zsh          # Powerlevel10k theme config
├── .tmux.conf         # Tmux configuration
├── aliases.zsh        # Custom aliases and functions
├── dev-env.zsh        # Development environment vars
└── fzf.zsh            # FZF configuration
```
