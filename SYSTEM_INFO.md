# System Information

This file contains detailed information about the Linux system where this terminal configuration was captured.

*Note: This configuration also supports macOS. See MACOS_SETUP.md for macOS-specific information.*

## Operating System
- **Distribution**: Ubuntu 22.04 LTS (Linux)
- **Kernel**: Linux
- **Architecture**: x86_64

## Shell Information
- **Current Shell**: /usr/bin/zsh
- **Zsh Version**: 5.8.1 (x86_64-ubuntu-linux-gnu)
- **Terminal**: xterm-256color

## Installed Packages and Versions

### Core Tools
- **Git**: 2.34.1
- **Python**: 3.10.12
- **Zsh**: 5.8.1-1
- **Tmux**: 3.2a-4ubuntu0.2

### Command Line Utilities
- **FZF**: 0.29.0-1ubuntu0.1 (fuzzy finder)
- **Exa**: 0.10.1-2 (modern ls replacement)
- **Bat**: 0.19.0-1ubuntu0.1 (cat with syntax highlighting)
- **Ripgrep**: 13.0.0-2ubuntu0.1 (fast grep alternative)
- **Htop**: 3.0.5-7build2 (interactive process viewer)

## Oh My Zsh Configuration

### Framework
- **Oh My Zsh**: Installed in `~/.oh-my-zsh`
- **Theme**: powerlevel10k/powerlevel10k

### Active Plugins
- git
- zsh-autosuggestions (custom)
- zsh-syntax-highlighting (custom)
- fzf
- colored-man-pages
- command-not-found
- history-substring-search
- sudo
- docker
- kubectl
- aws
- python
- pip
- node
- npm

### Custom Plugins Location
- **zsh-autosuggestions**: `~/.oh-my-zsh/custom/plugins/zsh-autosuggestions`
- **zsh-syntax-highlighting**: `~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting`

## Tmux Configuration

### Plugins (via TPM)
- **TPM**: Tmux Plugin Manager (`~/.tmux/plugins/tpm`)
- **tmux-sensible**: Basic tmux settings
- **dracula/tmux**: Dracula theme for tmux

### Features
- Mouse support enabled
- Vi-mode key bindings
- Cross-platform clipboard integration
- Custom status bar with git integration
- Base index starting from 1

## Custom Configuration Files

### Zsh Custom Files (`~/.oh-my-zsh/custom/`)
1. **aliases.zsh**: Custom aliases and functions
   - Enhanced ls commands using exa
   - Git shortcuts
   - Directory navigation helpers
   - Development tool shortcuts
   - Utility functions (extract, mkcd, fkill)

2. **dev-env.zsh**: Development environment variables
   - Node.js, Python, Go, Rust, Java configurations
   - Docker and AWS settings
   - Path configurations

3. **fzf.zsh**: FZF configuration
   - Custom color scheme
   - Integration with fd/fdfind
   - Key bindings and completion

## Package Manager
- **Primary**: APT (Advanced Package Tool)
- **Available**: dpkg, snap

## Environment Variables
- **SHELL**: /usr/bin/zsh
- **TERM**: xterm-256color
- **ZSH**: $HOME/.oh-my-zsh

## History Configuration
- **HISTSIZE**: 50000
- **SAVEHIST**: 50000
- **Options**: 
  - HIST_EXPIRE_DUPS_FIRST
  - HIST_IGNORE_DUPS
  - HIST_IGNORE_ALL_DUPS
  - HIST_IGNORE_SPACE
  - HIST_FIND_NO_DUPS
  - HIST_SAVE_NO_DUPS
  - HIST_BEEP
  - SHARE_HISTORY

## Powerlevel10k Configuration
- **Mode**: nerdfont-complete
- **Style**: Two-line prompt with decorative borders
- **Features**:
  - OS icon
  - Directory path with smart truncation
  - Git status with custom formatter
  - Command execution time
  - Background jobs indicator
  - Various development environment indicators
  - Time display

## File Locations
- **Zsh config**: `~/.zshrc`
- **Powerlevel10k config**: `~/.p10k.zsh`
- **Tmux config**: `~/.tmux.conf`
- **Oh My Zsh**: `~/.oh-my-zsh/`
- **Custom configs**: `~/.oh-my-zsh/custom/`
- **Tmux plugins**: `~/.tmux/plugins/`

## Installation Method
All packages were installed via APT package manager:
```bash
sudo apt install zsh git fzf exa bat ripgrep htop tmux
```

Custom components installed via Git:
- Oh My Zsh (curl installation script)
- Powerlevel10k theme
- Zsh plugins (autosuggestions, syntax-highlighting)
- Tmux Plugin Manager (TPM)
