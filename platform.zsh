# Platform Detection and Utilities

# Detect the current platform
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PLATFORM="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export PLATFORM="linux"
else
    export PLATFORM="unknown"
fi

# Cross-platform clipboard functions
pbcopy() {
    if [[ "$PLATFORM" == "macos" ]]; then
        command pbcopy
    elif command -v xclip > /dev/null; then
        xclip -in -selection clipboard
    elif command -v clip.exe > /dev/null; then
        clip.exe
    else
        cat > /dev/null
    fi
}

pbpaste() {
    if [[ "$PLATFORM" == "macos" ]]; then
        command pbpaste
    elif command -v xclip > /dev/null; then
        xclip -out -selection clipboard
    elif command -v powershell.exe > /dev/null; then
        powershell.exe Get-Clipboard
    else
        cat
    fi
}

# Cross-platform open command
open() {
    if [[ "$PLATFORM" == "macos" ]]; then
        command open "$@"
    elif command -v xdg-open > /dev/null; then
        xdg-open "$@"
    else
        echo "No suitable open command found"
    fi
}

# Cross-platform which function
pathwhich() {
    if [[ "$PLATFORM" == "macos" ]]; then
        # Use which on macOS
        which "$1"
    else
        # Use command -v on Linux
        command -v "$1"
    fi
}