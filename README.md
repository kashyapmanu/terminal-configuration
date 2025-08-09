# Terminal Configuration Setup

This document contains all the information needed to recreate this terminal setup exactly as configured.

## System Information
- **Operating System**: Linux (Ubuntu 22.04)
- **Shell**: Zsh 5.8.1
- **Terminal**: xterm-256color compatible

## Core Components

### 1. Zsh Shell
- **Version**: 5.8.1
- **Installation**: `sudo apt install zsh zsh-common`
- **Set as default**: `chsh -s $(which zsh)`

### 2. Oh My Zsh Framework
- **Installation**: 
  ```bash
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

### 3. Powerlevel10k Theme
- **Installation**:
  ```bash
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ```
- **Configuration**: Run `p10k configure` after installation

### 4. Zsh Plugins
Required plugins (installed in `~/.oh-my-zsh/custom/plugins/`):

#### zsh-autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### zsh-syntax-highlighting
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Essential Tools

### Command Line Tools
Install these packages via apt:
```bash
sudo apt update && sudo apt install -y \
  git \
  fzf \
  exa \
  bat \
  ripgrep \
  htop \
  tmux
```

### Tool Versions
- Git: 2.34.1
- FZF: 0.29.0
- Exa: 0.10.1
- Bat: 0.19.0
- Ripgrep: 13.0.0
- Htop: 3.0.5
- Tmux: 3.2a

## Configuration Files

### 1. Zsh Configuration (~/.zshrc)
Key features:
- Powerlevel10k theme
- Extensive plugin configuration
- History optimization
- Custom environment variables

### 2. Powerlevel10k Configuration (~/.p10k.zsh)
Features:
- Two-line prompt with decorative borders
- Git status integration
- Directory path optimization
- Command execution time display
- Background jobs indicator
- Various development environment indicators

### 3. Custom Zsh Files
Located in `~/.oh-my-zsh/custom/`:

#### aliases.zsh
- Enhanced ls commands (using exa)
- Git shortcuts
- Directory navigation
- Python, Docker, Kubernetes shortcuts
- Network utilities
- File operations with safety
- Custom functions (extract, mkcd, fkill)

#### dev-env.zsh
- Development environment variables
- Language-specific configurations (Node.js, Python, Go, Rust, Java)
- Docker and AWS settings
- Path configurations

#### fzf.zsh
- FZF configuration with custom colors
- Integration with fd for file searching
- Key bindings and completion setup

### 4. Tmux Configuration (~/.tmux.conf)
Features:
- Tmux Plugin Manager (TPM)
- Dracula theme
- Mouse support
- Vi-mode key bindings
- Cross-platform clipboard integration
- Custom status bar

## Tmux Plugins
Install TPM first:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then install plugins:
- tmux-sensible
- dracula/tmux

## Setup Instructions

### 1. Install Base System
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install zsh and make it default
sudo apt install zsh zsh-common
chsh -s $(which zsh)
```

### 2. Install Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 3. Install Powerlevel10k
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### 4. Install Zsh Plugins
```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### 5. Install Command Line Tools
```bash
sudo apt install -y git fzf exa bat ripgrep htop tmux
```

### 6. Install Tmux Plugin Manager
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 7. Copy Configuration Files
Copy all the configuration files from this repository to their respective locations:
- `.zshrc` → `~/.zshrc`
- `.p10k.zsh` → `~/.p10k.zsh`
- `.tmux.conf` → `~/.tmux.conf`
- `aliases.zsh` → `~/.oh-my-zsh/custom/aliases.zsh`
- `dev-env.zsh` → `~/.oh-my-zsh/custom/dev-env.zsh`
- `fzf.zsh` → `~/.oh-my-zsh/custom/fzf.zsh`

### 8. Install Tmux Plugins
```bash
# Start tmux and press prefix + I (Ctrl-b + I by default)
tmux
# Press Ctrl-b + I to install plugins
```

### 9. Configure Powerlevel10k
```bash
# Run the configuration wizard
p10k configure
```

## Font Requirements

For the best experience with Powerlevel10k, install a Nerd Font:
- Recommended: MesloLGS NF, Fira Code Nerd Font, or Hack Nerd Font
- Download from: https://www.nerdfonts.com/
- Configure your terminal emulator to use the installed font

## Additional Notes

### Aliases and Functions
The setup includes numerous helpful aliases and functions:
- `ll`, `la` - Enhanced directory listings with exa
- Git shortcuts: `gst`, `gco`, `gp`, `gl`, etc.
- Directory navigation: `..`, `...`, `....`
- Development shortcuts for Python, Docker, Kubernetes, AWS
- Utility functions: `extract()`, `mkcd()`, `fkill()`

### Environment Optimizations
- History configuration for better command recall
- FZF integration with custom colors and preview
- Development environment variables for various languages
- Cross-platform clipboard integration in tmux

### Theme Features
- Two-line prompt with git integration
- Command execution time display
- Directory path optimization
- Background job indicators
- Various development environment status indicators

## Troubleshooting

1. **Font Issues**: Ensure you have a Nerd Font installed and configured in your terminal
2. **Plugin Issues**: Run `omz reload` or restart your terminal
3. **Tmux Plugins**: Press `prefix + I` in tmux to install plugins
4. **Permissions**: Ensure all configuration files have proper permissions

## Customization

All configuration files are well-commented and can be customized:
- Modify aliases in `~/.oh-my-zsh/custom/aliases.zsh`
- Adjust environment variables in `~/.oh-my-zsh/custom/dev-env.zsh`
- Customize FZF behavior in `~/.oh-my-zsh/custom/fzf.zsh`
- Reconfigure Powerlevel10k with `p10k configure`
