# Development Environment Configuration

# Node.js and npm
if command -v node > /dev/null; then
    export NODE_OPTIONS="--max-old-space-size=4096"
fi

# Python
if command -v python3 > /dev/null; then
    export PYTHONDONTWRITEBYTECODE=1
    export PYTHONUNBUFFERED=1
fi

# Go
if command -v go > /dev/null; then
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi

# Rust
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# Java
if command -v java > /dev/null; then
    export JAVA_OPTS="-Xmx2g"
fi

# Docker
if command -v docker > /dev/null; then
    export DOCKER_BUILDKIT=1
    export COMPOSE_DOCKER_CLI_BUILD=1
fi

# AWS
if command -v aws > /dev/null; then
    export AWS_PAGER=""
    export AWS_DEFAULT_OUTPUT=json
fi

# Local bin paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
