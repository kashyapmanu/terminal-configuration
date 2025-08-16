# 🚀 Terminal Configuration

A comprehensive, production-ready terminal configuration that transforms any Linux or macOS system into a powerful development environment with modern tools and beautiful aesthetics.

![Terminal Preview](https://img.shields.io/badge/Terminal-Enhanced-brightgreen)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-orange)
![License](https://img.shields.io/badge/License-MIT-blue)
![Maintenance](https://img.shields.io/badge/Maintained-Yes-green)

## ✨ Features

- **🎨 Beautiful Interface**: Powerlevel10k theme with two-line prompt and git integration
- **⚡ Enhanced Productivity**: 100+ aliases, smart autosuggestions, and syntax highlighting
- **🛠️ Modern Tools**: exa, bat, ripgrep, fzf, and other CLI improvements
- **🔧 Development Ready**: Pre-configured for Node.js, Python, Docker, Kubernetes, AWS
- **📱 Cross-Platform**: Linux and macOS support with clipboard integration
- **🚀 One-Command Install**: Automated setup with backup and restore capabilities

## 🎯 Quick Start

### Option 1: Automated Installation (Recommended)
```bash
git clone https://github.com/kashyapmanu/terminal-configuration.git
cd terminal-configuration
./install.sh
```

### Option 2: Advanced Installation
```bash
# After basic installation
./install-advanced.sh
```

### Option 3: Quick Setup (Experienced Users)
See [QUICK_SETUP.md](QUICK_SETUP.md) for condensed instructions.

### macOS-Specific Instructions
See [MACOS_SETUP.md](MACOS_SETUP.md) for detailed macOS installation and configuration instructions.

## 📋 What You Get

### Core Components
- **Zsh 5.8.1** with Oh My Zsh framework
- **Powerlevel10k theme** with customizable prompt
- **Essential plugins**: autosuggestions, syntax highlighting, fzf integration
- **Tmux 3.2a** with Dracula theme and mouse support
- **Modern CLI tools**: Enhanced replacements for common commands

### Key Features
- **Smart Command Completion**: Context-aware suggestions based on history
- **Git Integration**: Branch status, commit info, and shortcuts in prompt
- **Fuzzy Finding**: Fast file and directory navigation with preview
- **Development Tools**: Language-specific configurations and shortcuts
- **System Monitoring**: Built-in performance and resource monitoring
- **Cross-Platform Clipboard**: Seamless copy/paste across Linux and macOS

## 🛠️ System Requirements

- **OS**: Ubuntu 18.04+, Debian 10+, or macOS 10.15+ (Catalina)
- **Terminal**: Any modern terminal emulator (Terminal.app, iTerm2, etc. on macOS)
- **Font**: Nerd Font recommended (auto-installed)
- **Internet**: Required for initial setup
- **Package Manager**: APT for Linux, Homebrew for macOS (will be installed if missing)

## 📁 Project Structure

```
terminal-configuration/
├── 📋 Documentation
│   ├── README.md              # This file
│   ├── QUICK_SETUP.md         # Fast installation guide
│   ├── SYSTEM_INFO.md         # System specifications
│   ├── ENHANCEMENTS.md        # Advanced improvements
│   └── PROJECT_OVERVIEW.md    # Project summary
│
├── 🔧 Configuration Files
│   ├── .zshrc                 # Main Zsh configuration
│   ├── .p10k.zsh             # Powerlevel10k theme
│   ├── .tmux.conf             # Tmux configuration
│   ├── aliases.zsh            # Custom aliases and functions
│   ├── dev-env.zsh            # Development environment
│   ├── fzf.zsh                # Fuzzy finder configuration
│   └── platform.zsh           # Platform detection utilities
│
└── 🚀 Installation Scripts
    ├── install.sh             # Main installer
    ├── install-advanced.sh    # Advanced features
    └── MACOS_SETUP.md         # macOS-specific setup guide
```

## 🎨 Customization

### Theme Configuration
```bash
p10k configure  # Interactive theme customization
```

### Custom Aliases
Edit `~/.oh-my-zsh/custom/aliases.zsh` to add your own shortcuts.

### Environment Variables
Modify `~/.oh-my-zsh/custom/dev-env.zsh` for development tools.

### FZF Behavior
Customize `~/.oh-my-zsh/custom/fzf.zsh` for fuzzy finding preferences.

## 🔧 Advanced Features

See [ENHANCEMENTS.md](ENHANCEMENTS.md) for additional tools and configurations:
- Modern CLI replacements (fd, procs, dust, duf)
- Additional Zsh plugins and themes
- Development tool managers (nvm, rustup)
- Security enhancements and SSH configuration
- Performance monitoring and system information

## 🐛 Troubleshooting

### Common Issues

**Fonts appear broken or missing icons:**
```bash
# Install a Nerd Font and configure your terminal
# Recommended: FiraCode Nerd Font, Hack Nerd Font
```

**Plugins not working:**
```bash
omz reload  # Reload Oh My Zsh
source ~/.zshrc  # Reload configuration
```

**Tmux plugins missing:**
```bash
# In tmux session, press: Ctrl-b + I
```

**Permission issues:**
```bash
chmod +x install.sh install-advanced.sh
```

### Getting Help
1. Check [existing issues](https://github.com/kashyapmanu/terminal-configuration/issues)
2. Review documentation files
3. Create a new issue with system details

## 🤝 Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Areas for Contribution
- Platform support (Windows, other Linux distros)
- New tool integrations
- Theme variations
- Documentation improvements
- Performance optimizations
- macOS-specific enhancements

## 📊 Performance

- **Startup Time**: ~200ms cold start, ~50ms warm start
- **Memory Usage**: ~15-20MB for Zsh, ~5-10MB for Tmux
- **Compatibility**: Works with all major terminal emulators

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Oh My Zsh](https://ohmyz.sh/) - Zsh framework
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Theme
- [Dracula](https://draculatheme.com/) - Tmux theme
- Modern CLI tools community

## 📈 Stats

![GitHub stars](https://img.shields.io/github/stars/kashyapmanu/terminal-configuration)
![GitHub forks](https://img.shields.io/github/forks/kashyapmanu/terminal-configuration)
![GitHub issues](https://img.shields.io/github/issues/kashyapmanu/terminal-configuration)
![GitHub last commit](https://img.shields.io/github/last-commit/kashyapmanu/terminal-configuration)

---

**Ready to transform your terminal experience?** ⭐ Star this repo and start with `./install.sh`!
