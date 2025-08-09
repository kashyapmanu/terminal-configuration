# FZF configuration
if command -v fzf > /dev/null; then
    # FZF default options
    export FZF_DEFAULT_OPTS='
        --height 40% 
        --layout=reverse 
        --border 
        --preview-window=right:60%:wrap
        --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
        --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'

    # Use fd for file searching if available
    if command -v fdfind > /dev/null; then
        export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git --exclude node_modules'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fdfind --type d --hidden --follow --exclude .git --exclude node_modules'
    fi

    # FZF key bindings and completion
    [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
    [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
    
    # Alternative locations for different distributions
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    [ -f /usr/local/share/fzf/shell/key-bindings.zsh ] && source /usr/local/share/fzf/shell/key-bindings.zsh
fi
