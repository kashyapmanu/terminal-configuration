# Terminal Configuration Project - Qwen Context

This document provides essential context about the terminal-configuration project for Qwen Code interactions. This project provides a comprehensive, production-ready terminal setup for Linux and macOS systems, transforming them into powerful development environments.

## Project Type
**Non-Code Project / Configuration Repository**

This is primarily a configuration repository containing scripts and dotfiles to set up a modern terminal environment. While it contains executable shell scripts, its core purpose is distributing and managing terminal configurations rather than developing software logic.

## Key Technologies & Components

### Core Shell Environment
- **Zsh**: Primary shell with Oh My Zsh framework
- **Powerlevel10k**: Theme with customizable, informative prompt
- **Tmux**: Terminal multiplexer with Dracula theme

### Essential Plugins & Tools
- **zsh-autosuggestions**: Smart command suggestions
- **zsh-syntax-highlighting**: Real-time command syntax highlighting
- **FZF**: Fuzzy finder for files, history, and more
- **Modern CLI Tools**: 
  - `exa`/`eza` (enhanced `ls`)
  - `bat` (enhanced `cat`)
  - `ripgrep` (enhanced `grep`)
  - `fd`/`fdfind` (enhanced `find`)

### Development Integrations
- Git with enhanced prompt status
- Docker, Kubernetes (kubectl), and AWS CLI shortcuts
- Language support for Node.js, Python, Go, Rust, Java
- Cross-platform clipboard integration (Linux, macOS, WSL2)

## Project Structure & Key Files

```
terminal-configuration/
├── Documentation
│   ├── README.md              # Complete setup guide
│   ├── QUICK_SETUP.md         # Fast installation instructions
│   ├── SYSTEM_INFO.md         # System specifications and setup details
│   ├── ENHANCEMENTS.md        # Advanced improvement suggestions
│   └── CONTRIBUTING.md        # Contribution guidelines
│
├── Configuration Files
│   ├── .zshrc                 # Main Zsh configuration
│   ├── .p10k.zsh              # Powerlevel10k theme settings
│   ├── .tmux.conf             # Tmux configuration with Dracula theme
│   ├── aliases.zsh            # Custom aliases and functions
│   ├── dev-env.zsh            # Development environment variables
│   └── fzf.zsh                # FZF fuzzy finder configuration
│
└── Installation Scripts
    ├── install.sh             # Main installation script
    └── install-advanced.sh    # Advanced enhancements installer
```

### Most Important Files

1. **`.zshrc`**: The main Zsh configuration file that loads plugins, sets options, and sources other configuration files.
2. **`.p10k.zsh`**: Powerlevel10k theme configuration defining the prompt's appearance and segments.
3. **`.tmux.conf`**: Tmux configuration with theme and keybindings.
4. **`aliases.zsh`**: Contains custom aliases and utility functions that enhance productivity.
5. **`install.sh`**: The primary script to automatically set up the entire configuration.
6. **`README.md`**: The main documentation file with comprehensive setup instructions.

## Usage Instructions

### Installation
For a complete automated setup:
```bash
git clone <this-repo>
cd terminal-configuration
./install.sh
```

### Quick Setup (For Experienced Users)
See `QUICK_SETUP.md` for a condensed installation process.

### Manual Configuration
Individual components can be copied to their respective locations:
- `.zshrc` → `~/.zshrc`
- `.p10k.zsh` → `~/.p10k.zsh`
- `.tmux.conf` → `~/.tmux.conf`
- `aliases.zsh` → `~/.oh-my-zsh/custom/aliases.zsh`
- `dev-env.zsh` → `~/.oh-my-zsh/custom/dev-env.zsh`
- `fzf.zsh` → `~/.oh-my-zsh/custom/fzf.zsh`

## Customization

### Powerlevel10k Theme
Run `p10k configure` for interactive theme customization.

### Aliases and Functions
Edit `~/.oh-my-zsh/custom/aliases.zsh` to add or modify shortcuts.

### Environment Variables
Modify `~/.oh-my-zsh/custom/dev-env.zsh` for development tool configurations.

### FZF Behavior
Customize `~/.oh-my-zsh/custom/fzf.zsh` for fuzzy finding preferences.

## Key Features

1. **Beautiful Interface**: Two-line Powerlevel10k prompt with Git integration
2. **Enhanced Productivity**: Over 100 aliases and smart autosuggestions
3. **Modern Tools**: Replacements for common commands with enhanced functionality
4. **Development Ready**: Pre-configured for major development tools and languages
5. **Cross-Platform**: Works on Linux, macOS, and WSL2 with clipboard integration
6. **One-Command Install**: Automated setup with backup and restore capabilities

## Development Conventions

This repository follows these conventions:
- Configuration files are kept in the root for easy copying
- Documentation is comprehensive and user-focused
- Installation scripts are idempotent (safe to run multiple times)
- Backup of existing configurations is performed before installation
- Clear separation between core configuration and user customizations

## Advanced Features

See `ENHANCEMENTS.md` for:
- Additional modern CLI tools
- More Zsh plugins
- Development tool managers (nvm, rustup)
- Security enhancements
- Performance monitoring

## Contributing

See `CONTRIBUTING.md` for guidelines on:
- Reporting bugs
- Requesting features
- Submitting code changes
- Improving documentation
- Testing changes