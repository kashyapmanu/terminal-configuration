# macOS Setup Guide

This guide provides macOS-specific instructions for setting up the terminal configuration.

## 📋 Prerequisites

- **OS**: macOS 10.15+ (Catalina or later)
- **Terminal**: Terminal.app, iTerm2, or any modern terminal emulator
- **Homebrew**: Package manager for macOS (will be installed if missing)

## 🍺 Installing Homebrew

If you don't have Homebrew installed, the installation script will automatically install it for you. However, if you prefer to install it manually:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 🚀 Installation

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

## 🛠️ macOS-Specific Features

### Enhanced Clipboard Integration
- Seamless copy/paste between terminal and system clipboard
- Works with all supported applications

### Native macOS Shortcuts
- Compatible with standard macOS keyboard shortcuts
- Proper integration with macOS function keys

### Font Support
- Automatic installation of Nerd Fonts via Homebrew
- Support for both built-in and third-party terminal emulators

## 🔧 macOS-Specific Configuration

### Terminal Emulator Settings
For the best experience, configure your terminal emulator:

1. **Terminal.app**:
   - Preferences → Profiles → Text → Font → Select a Nerd Font
   - Preferences → Profiles → Keyboard → Check "Use Option as Meta key"

2. **iTerm2** (Recommended):
   - Preferences → Profiles → Text → Font → Select a Nerd Font
   - Preferences → Keys → Key Bindings → Presets → Natural Text Editing

### Shell Integration
The installation script will automatically:
- Set Zsh as your default shell
- Add Zsh to the list of allowed shells
- Configure proper paths for Homebrew installations

## 🎨 Theme Considerations

### Color Profiles
- The Powerlevel10k theme works with both light and dark modes
- iTerm2 users can import the Dracula theme for enhanced visuals

### Icon Display
- Ensure your terminal is using a Nerd Font for proper icon display
- The installation script will install recommended fonts automatically

## 🐛 Common macOS Issues

### Zsh Not Set as Default
If you see a message that Zsh is not your default shell:
```bash
chsh -s /bin/zsh
```

### Permission Issues
If you encounter permission issues with Homebrew:
```bash
sudo chown -R $(whoami) /usr/local/share/zsh /usr/local/share/zsh/site-functions
```

### Font Issues
If icons appear as question marks or boxes:
1. Restart your terminal application
2. Verify a Nerd Font is selected in your terminal preferences
3. Run `p10k configure` to reconfigure the theme

### Homebrew Path Issues
If commands installed via Homebrew are not found:
```bash
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

For Apple Silicon Macs, Homebrew installs to `/opt/homebrew`, while Intel Macs use `/usr/local`.

## 🔄 Updates

### Updating Homebrew Packages
```bash
brew update && brew upgrade
```

### Updating Terminal Configuration
```bash
cd ~/terminal-configuration
git pull
./install.sh
```

## 🧪 Testing Your Setup

To verify everything is working correctly:
1. Open a new terminal window
2. Check that the Powerlevel10k prompt appears
3. Try using some aliases like `ll` or `gst`
4. Test fuzzy finder with `Ctrl+T`
5. Verify clipboard integration works

## 🤝 Getting Help

If you encounter issues:
1. Check this guide for macOS-specific solutions
2. Review the main README.md for general troubleshooting
3. Create an issue with your macOS version and error details