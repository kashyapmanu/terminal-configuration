# Terminal Configuration User Guide

This guide provides a comprehensive overview of the tools, configurations, and shortcuts available in your enhanced terminal setup.

## Table of Contents
1. [Terminal Environment](#terminal-environment)
2. [Shell (Zsh) & Framework (Oh My Zsh)](#shell-zsh--framework-oh-my-zsh)
3. [Prompt (Powerlevel10k)](#prompt-powerlevel10k)
4. [Terminal Multiplexer (Tmux)](#terminal-multiplexer-tmux)
5. [Essential Tools](#essential-tools)
6. [Advanced Tools](#advanced-tools)
7. [Aliases & Functions](#aliases--functions)
8. [Fuzzy Finder (FZF)](#fuzzy-finder-fzf)
9. [Development Environment](#development-environment)

## Terminal Environment

### Shell (Zsh) & Framework (Oh My Zsh)

Your terminal uses Zsh (Z shell) as the default shell with the Oh My Zsh framework for enhanced functionality.

**Key Features:**
- Enhanced auto-completion
- Customizable themes
- Plugin support
- Improved history management

**Configuration Files:**
- `~/.zshrc`: Main configuration file
- `~/.oh-my-zsh/custom/aliases.zsh`: Custom aliases
- `~/.oh-my-zsh/custom/dev-env.zsh`: Development environment variables
- `~/.oh-my-zsh/custom/platform.zsh`: Cross-platform utilities
- `~/.oh-my-zsh/custom/fzf.zsh`: FZF configuration

**Plugins Installed:**
- `git`: Git aliases and functions
- `zsh-autosuggestions`: Intelligent command suggestions
- `zsh-syntax-highlighting`: Real-time command syntax highlighting
- `fzf`: Fuzzy finder integration
- `colored-man-pages`: Colorized manual pages
- `command-not-found`: Suggestions when commands aren't found
- `history-substring-search`: Navigate command history with substring matching
- `sudo`: Double press ESC to add sudo to current command
- `docker`, `kubectl`, `aws`: Cloud/container tools aliases
- `python`, `pip`, `node`, `npm`: Language-specific completions

### Prompt (Powerlevel10k)

Powerlevel10k provides a fast, customizable, and informative prompt.

**Features:**
- Two-line prompt with clear separation
- Git status indicators
- Color-coded prompt character (green = success, red = error)
- OS icon indicator
- Execution time for long-running commands
- Current directory with truncation for long paths

**Segments:**
1. Left side:
   - OS icon
   - Current directory
   - Git status (branch, changes, etc.)
   - Prompt character

2. Right side:
   - Exit code status
   - Command execution time (for commands > 3 seconds)
   - Background jobs indicator
   - Virtual environment (Python, Node, etc.)
   - Kubernetes context
   - AWS profile
   - Current time
   - User@hostname

**Customization:**
- Run `p10k configure` for interactive configuration
- Edit `~/.p10k.zsh` for manual configuration

### Terminal Multiplexer (Tmux)

Tmux allows you to manage multiple terminal sessions in a single window.

**Configuration:**
- Dracula theme with custom status bar
- Vi-style key bindings
- Mouse support
- Cross-platform clipboard integration

**Key Bindings:**
- Prefix key: `Ctrl-b` (default)
- Create new window: `Prefix + c`
- Switch windows: `Prefix + n` (next), `Prefix + p` (previous)
- Split pane horizontally: `Prefix + "`
- Split pane vertically: `Prefix + %`
- Navigate panes: `Prefix + [h,j,k,l]` (vi-style)
- Resize panes: `Prefix + Ctrl+[h,j,k,l]`
- Copy mode: `Prefix + [`
- Paste: `Prefix + ]`
- Reload config: `Prefix + r`

**Status Bar Information:**
- Session name
- Window list
- Current directory
- Git branch
- Time and date

## Essential Tools

### Git
Distributed version control system.

**Key Aliases:**
- `gst`: Git status
- `gco`: Git checkout
- `gcb`: Git checkout -b
- `gp`: Git push
- `gl`: Git pull
- `glog`: Git log with graph
- `gd`: Git diff
- `ga`: Git add
- `gc`: Git commit
- `gcm`: Git commit -m
- `gca`: Git commit -am

### Modern Command-Line Tools

#### eza (replacement for ls)
Enhanced file listing tool with colors, icons, and git status.

**Aliases:**
- `ls`: eza with icons
- `ll`: Long format with git status
- `la`: All files with git status
- `tree`: Tree view of directories

#### bat (replacement for cat)
Syntax-highlighted file viewer with git integration.

**Aliases:**
- `cat`: bat (syntax highlighted)
- `less`: bat (syntax highlighted)

#### ripgrep (replacement for grep)
Extremely fast text search tool.

**Alias:**
- `grep`: ripgrep

#### fd (replacement for find)
Simple, fast, and user-friendly alternative to find.

**Alias:**
- `find`: fd

#### fzf (fuzzy finder)
Command-line fuzzy finder for files, history, and more.

**Key Bindings:**
- `Ctrl-t`: Find files
- `Ctrl-r`: Search command history
- `Alt-c`: Change directory

#### htop (replacement for top)
Interactive process viewer.

**Alias:**
- `top`: htop

### Tmux Plugin Manager (TPM)
Plugin manager for tmux.

**Usage:**
- Install plugins: `Prefix + I`
- Update plugins: `Prefix + U`
- Remove plugins: `Prefix + Alt+u`

### Zsh Plugins

#### zsh-autosuggestions
Intelligent command suggestions based on history and completions.

**Usage:**
- Press right arrow or Ctrl-e to accept suggestion
- Press Ctrl-] to accept word

#### zsh-syntax-highlighting
Real-time command syntax highlighting.

**Features:**
- Valid commands in green
- Invalid commands in red
- Paths with underlines

## Advanced Tools

These tools are installed via the `install-advanced.sh` script.

### Directory Navigation

#### zoxide (smart cd)
Fast directory navigation with machine learning.

**Usage:**
- `z <directory>`: Jump to directory
- `zi`: Interactive directory selection

#### zsh-z (directory jumping)
Jump to directories based on frecency (frequency + recency).

### System Information Tools

#### procs (replacement for ps)
Modern process viewer with colorized output.

**Alias:**
- `ps`: procs

#### dust (replacement for du)
Intuitive disk usage analyzer with visualizations.

**Alias:**
- `du`: dust

#### duf (replacement for df)
Improved disk space usage visualization.

**Alias:**
- `df`: duf

#### ncdu
Disk usage analyzer with ncurses interface.

#### neofetch
System information display tool.

### Development Tools

#### Node Version Manager (NVM)
Manage multiple Node.js versions.

**Usage:**
- `nvm install <version>`: Install Node version
- `nvm use <version>`: Switch to Node version
- `nvm list`: List installed versions

#### Delta
Syntax-highlighted diff tool for Git.

**Usage:**
- Automatically used as Git pager when available

#### broot
Improved tree view and directory navigation tool.

#### Additional Zsh Plugins

##### zsh-autopair
Auto-close brackets, quotes, and tags.

##### zsh-completions
Additional completion definitions.

##### you-should-use
Reminder to use defined aliases.

### Modern CLI Tools

#### fd
Simple, fast and user-friendly alternative to find.

#### tree
Display directories as trees.

#### tldr
Simplified and community-driven man pages.

#### jq
Command-line JSON processor.

#### yq
Command-line YAML processor.

#### cmatrix
Terminal-based Matrix screensaver.

#### figlet
Create large letters out of ordinary text.

#### cowsay
Text-based cow that speaks.

#### fortune
Display random quotations.

#### lolcat
Rainbow coloring for text.

### Additional Tools

#### curl & wget
Command-line tools for transferring data.

#### ncdu
Disk usage analyzer with ncurses interface.

## Aliases & Functions

### Navigation
- `..`: cd ..
- `...`: cd ../..
- `....`: cd ../../..
- `.....`: cd ../../../..

### System
- `h`: history
- `c`: clear
- `reload`: source ~/.zshrc
- `zshconfig`: Edit ~/.zshrc
- `aliases`: Edit aliases file

### File Operations
- `cp`: cp -i (interactive)
- `mv`: mv -i (interactive)
- `rm`: rm -i (interactive)
- `mkdir`: mkdir -pv (create parent dirs, verbose)

### Search and Find
- `grep`: ripgrep (if available)
- `find`: fd (if available)

### Python
- `py`: python3
- `pip`: pip3
- `venv`: python3 -m venv
- `activate`: source venv/bin/activate

### Docker
- `dps`: docker ps
- `dpa`: docker ps -a
- `di`: docker images
- `dex`: docker exec -it
- `dlog`: docker logs
- `dstop`: Stop all containers
- `drm`: Remove all containers
- `drmi`: Remove all images

### Docker Compose
- `dc`: docker-compose
- `dcu`: docker-compose up
- `dcd`: docker-compose down
- `dcb`: docker-compose build
- `dcl`: docker-compose logs -f
- `dcp`: docker-compose ps
- `dcr`: docker-compose restart

### Kubernetes (kubectl)
- `k`: kubectl
- `kgp`: kubectl get pods
- `kgs`: kubectl get services
- `kgd`: kubectl get deployments
- `kdp`: kubectl describe pod
- `kds`: kubectl describe service
- `kdd`: kubectl describe deployment

### AWS CLI
- `awsp`: List AWS profiles
- `awswho`: Show current AWS identity

### Network
- `myip`: Show public IP address
- `ports`: Show listening ports
- `serve`: Start HTTP server on port 8000

### Git (Enhanced)
- `glog`: Git log with enhanced formatting
- `gstash`: Git stash with message
- `gunstash`: Git stash pop
- `gclean`: Git clean
- `greset`: Git reset hard

### Functions
- `extract <file>`: Extract archives (tar, zip, rar, etc.)
- `mkcd <dir>`: Create directory and cd into it
- `fkill`: Find and kill processes with fzf
- `weather <city>`: Show weather for a city
- `note <text>`: Add note to ~/notes.txt
- `notes`: View all notes
- `psg <process>`: Search for processes
- `serve_port <port>`: Start HTTP server on specified port
- `timer <seconds>`: Start a timer
- `pomodoro`: Start a 25-minute pomodoro timer
- `mkproject <name>`: Create a new project directory with Git init
- `backup_configs`: Backup configuration files

### Advanced Aliases (from aliases-advanced.zsh)

#### System Monitoring
- `cpu`: Top processes by CPU usage
- `mem`: Top processes by memory usage
- `speedtest`: Run network speed test

#### Development Shortcuts
- `jsonpp`: Pretty print JSON
- `urlencode`: URL encode text
- `urldecode`: URL decode text

#### Fun Aliases
- `matrix`: Matrix screensaver
- `starwars`: Play Star Wars in terminal
- `fortune`: Display random quote with cow

#### Modern Tool Replacements
- `cd`: zoxide (if available)
- `ps`: procs (if available)
- `du`: dust (if available)
- `df`: duf (if available)

## Fuzzy Finder (FZF)

FZF is a general-purpose command-line fuzzy finder.

**Key Bindings:**
- `Ctrl-t`: Paste selected file path into command line
- `Ctrl-r`: Search command history
- `Alt-c`: cd into selected directory

**Custom Aliases:**
- `fzfp`: FZF with file preview
- `fzfd`: FZF for directory selection and cd

**Configuration:**
- Custom color scheme matching terminal theme
- Uses fd for file searching (faster than default find)
- Preview window showing file contents

## Development Environment

### Node.js
- Increased memory limit (4GB)
- NVM integration for version management
- Global npm packages installed to ~/.npm-global

**NPM Aliases:**
- `ni`: npm install
- `nid`: npm install --save-dev
- `nig`: npm install -g
- `nr`: npm run
- `ns`: npm start
- `nt`: npm test
- `nb`: npm run build

### Python
- Prevents writing .pyc files (PYTHONDONTWRITEBYTECODE)
- Forces unbuffered output (PYTHONUNBUFFERED)

### Go
- GOPATH set to ~/go
- ~/go/bin added to PATH

### Rust
- Cargo environment loaded automatically
- ~/.cargo/bin added to PATH

### Java
- Increased heap size (2GB)

### Docker
- BuildKit enabled for faster builds
- CLI integration for Docker Compose

### AWS
- JSON output by default
- No pager for easier scripting

### Cross-Platform Utilities
- `pbcopy`: Copy to clipboard (works on macOS, Linux, WSL2)
- `pbpaste`: Paste from clipboard (works on macOS, Linux, WSL2)
- `open`: Open files/URLs with default application
- `pathwhich`: Cross-platform command location finder

### SSH Configuration
Enhanced SSH configuration for better security and connection management:
- Automatic keep-alive
- Connection multiplexing
- Automatic key management

### System Information
Run `sysinfo` to display detailed system information including:
- OS version
- Kernel version
- Hardware information
- CPU details
- Memory usage
- Disk usage
- Uptime and load

## Shortcuts Summary

### Navigation Shortcuts
| Shortcut | Command | Description |
|----------|---------|-------------|
| Ctrl-t | fzf | Find files |
| Ctrl-r | fzf | Search history |
| Alt-c | fzf | Change directory |
| .. | cd .. | Go up one directory |
| ... | cd ../.. | Go up two directories |

### Tmux Shortcuts
| Shortcut | Description |
|----------|-------------|
| Prefix + c | Create new window |
| Prefix + n/p | Switch windows |
| Prefix + " | Split pane horizontally |
| Prefix + % | Split pane vertically |
| Prefix + [hjkl] | Navigate panes |
| Prefix + I | Install plugins |
| Prefix + r | Reload config |

### Command Shortcuts
| Shortcut | Command | Description |
|----------|---------|-------------|
| ESC+ESC | sudo | Add sudo to current command |
| Up/Down | History | Navigate command history |
| Tab | Completion | Auto-complete commands/paths |

### Powerlevel10k Shortcuts
| Action | Description |
|--------|-------------|
| p10k configure | Customize prompt |
| Source ~/.zshrc | Reload configuration |

### Advanced Tools Shortcuts
| Command | Description |
|---------|-------------|
| z <dir> | Jump to directory |
| procs | Enhanced process viewer |
| dust | Enhanced disk usage |
| duf | Enhanced disk free |
| sysinfo | Display system information |
| weather <city> | Show weather |
| timer <seconds> | Start a timer |

This guide covers the main tools and configurations in your terminal setup. For more details on any specific tool, check the respective documentation or man pages.